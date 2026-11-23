function [data, cancelled] = readRaw(path, dims, opts)
%READRAW Read a raw binary 4D-STEM file into a (kx, ky, rx, ry) array.
%
% Detector crop, binning and scan sampling are applied while reading. Integer data
% is returned as single (double for 64-bit types), so it can be used with mtimes.
% Replaces the "Physical Memory" branch of the app's read_file, which used a
% hard-coded 4-byte stride, ignored the byte order, kept integer classes and summed
% (rather than sampled) probe positions.
%
% Usage::
%
%     data = quant4d.readRaw(path, [kx ky rx ry])
%     data = quant4d.readRaw(path, [kx ky rx ry], Order="rk", DataType="uint16", ByteOrder="b")
%     [data, cancelled] = quant4d.readRaw(..., Progress=@(done, total) keepGoing)
%
% Parameters:
%     path (str) : file to read
%     dims ([int int int int]) : detector and scan size [kx ky rx ry] of the whole file,
%         whatever its layout
%     Order (str) : file axes, fastest first: "kr" (kx ky rx ry, frames contiguous,
%         default), "kr_inv" (ky kx ry rx), "rk" (rx ry kx ky, probe positions
%         contiguous) or "rk_inv" (ry rx ky kx)
%     DataType (str) : MATLAB class of the stored values, e.g. "single", "uint16"
%     ByteOrder (str) : "l" (little-endian, default) or "b" (big-endian)
%     Offset (int) : bytes before the first block
%     Header (int) : bytes before each block of the two fastest file axes
%     Footer (int) : bytes after each such block (EMPAD: 1024)
%     PixelStart ([int int]) : first detector pixel [kx ky] to read, 1-based
%     NumPixels ([int int]) : output pixels after binning; NaN = as many as fit
%     Binning (int) : detector binning factor; sums Binning x Binning pixels
%     FrameStart ([int int]) : first probe position [rx ry], 1-based
%     NumFrames ([int int]) : output probe positions; NaN = as many as fit
%     Sampling (int) : keep every Sampling-th probe position along rx and ry
%     Progress (function_handle) : called as Progress(done, total); return false to
%         cancel
%
% Returns:
%     data (single | double) : (kx, ky, rx, ry) array, or [] if cancelled
%     cancelled (bool) : true if Progress returned false
arguments
    path {mustBeTextScalar}
    dims (1,4) double {mustBeInteger, mustBePositive}
    opts.Order {mustBeMember(opts.Order, ["kr" "kr_inv" "rk" "rk_inv"])} = "kr"
    opts.DataType {mustBeTextScalar} = "single"
    opts.ByteOrder {mustBeMember(opts.ByteOrder, ["l" "b"])} = "l"
    opts.Offset (1,1) double {mustBeNonnegative} = 0
    opts.Header (1,1) double {mustBeNonnegative} = 0
    opts.Footer (1,1) double {mustBeNonnegative} = 0
    opts.PixelStart (1,2) double {mustBePositive} = [1 1]
    opts.NumPixels (1,2) double = [NaN NaN]
    opts.Binning (1,1) double {mustBeInteger, mustBePositive} = 1
    opts.FrameStart (1,2) double {mustBePositive} = [1 1]
    opts.NumFrames (1,2) double = [NaN NaN]
    opts.Sampling (1,1) double {mustBeInteger, mustBePositive} = 1
    opts.Progress = []
end

order = char(opts.Order);
dtype = char(opts.DataType);
outType = quant4d.internal.outputClass(dtype);
bytes = quant4d.internal.byteSize(dtype);

% file axis sizes, fastest first: logical axis i is file axis perm(i)
perm = quant4d.internal.axisPermutation(order);
fileSize = zeros(1, 4);
fileSize(perm) = dims;
logicalSize = dims;

[kx, ky, nPix] = quant4d.internal.pixelIndices(logicalSize(1:2), opts.PixelStart, opts.NumPixels, opts.Binning);
[rx, ry, nFr] = quant4d.internal.frameIndices(logicalSize(3:4), opts.FrameStart, opts.NumFrames, opts.Sampling);

swapped = numel(order) > 2;                         % "_inv": the two axes of each pair swapped
blockElems = prod(fileSize(1:2));
blockBytes = opts.Header + blockElems*bytes + opts.Footer;
precision = [dtype '=>' outType];

fid = fopen(path, 'r', char(opts.ByteOrder));
if fid < 0
    error('quant4d:readRaw:open', 'Cannot open %s.', path);
end
closer = onCleanup(@() fclose(fid));

data = zeros([nPix nFr], outType);
cancelled = false;

if order(1) == 'k'
    % -------- frames contiguous: one block per probe position --------
    total = numel(rx)*numel(ry);
    done = 0;
    for j = 1:numel(ry)
        for i = 1:numel(rx)
            if swapped
                outer = (ry(j) - 1) + (rx(i) - 1)*fileSize(3);   % file outer axes (ry, rx)
            else
                outer = (rx(i) - 1) + (ry(j) - 1)*fileSize(3);   % file outer axes (rx, ry)
            end
            block = readBlock(fid, opts.Offset + outer*blockBytes + opts.Header, ...
                              fileSize(1:2), precision, path);
            if swapped
                block = block.';                                % (ky, kx) -> (kx, ky)
            end
            data(:, :, i, j) = quant4d.internal.bin(block(kx, ky), opts.Binning);

            done = done + 1;
            if ~keepGoing(opts.Progress, done, total)
                cancelled = true;
                data = [];
                return
            end
        end
    end
else
    % -------- probe positions contiguous: one block per detector pixel --------
    total = numel(kx)*numel(ky);
    done = 0;
    b = opts.Binning;
    for j = 1:numel(ky)
        for i = 1:numel(kx)
            if swapped
                outer = (ky(j) - 1) + (kx(i) - 1)*fileSize(3);   % file outer axes (ky, kx)
            else
                outer = (kx(i) - 1) + (ky(j) - 1)*fileSize(3);   % file outer axes (kx, ky)
            end
            block = readBlock(fid, opts.Offset + outer*blockBytes + opts.Header, ...
                              fileSize(1:2), precision, path);
            if swapped
                block = block.';                                % (ry, rx) -> (rx, ry)
            end
            ii = ceil(i/b);
            jj = ceil(j/b);
            data(ii, jj, :, :) = data(ii, jj, :, :) + reshape(block(rx, ry), [1 1 nFr]);

            done = done + 1;
            if ~keepGoing(opts.Progress, done, total)
                cancelled = true;
                data = [];
                return
            end
        end
    end
end
end

function block = readBlock(fid, position, blockSize, precision, path)
if fseek(fid, position, 'bof') ~= 0
    error('quant4d:readRaw:eof', 'Cannot seek to byte %d of %s: file too short for these settings.', ...
          position, path);
end
[block, count] = fread(fid, blockSize, precision);
if count < prod(blockSize)
    error('quant4d:readRaw:eof', 'End of %s reached at byte %d: file too short for these settings.', ...
          path, position);
end
end

function tf = keepGoing(progress, done, total)
tf = true;
if ~isempty(progress)
    tf = progress(done, total);
    if isempty(tf)
        tf = true;
    end
end
end
