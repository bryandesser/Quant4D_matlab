function [data, cancelled] = readHDF5(path, dataset, opts)
%READHDF5 Read a 4D-STEM HDF5 dataset into a (kx, ky, rx, ry) array.
%
% Supports 4-D datasets stored in C order as (ry, rx, ky, kx), as written by py4DSTEM
% and by Quant4D's own export ("/STEM4D"), and 3-D datasets stored as (N, ky, kx).
% Replaces the HDF5 branch of the app's read_file, which built the file dataspace by
% hand and so failed on non-square detectors and 3-D datasets.
%
% Usage::
%
%     data = quant4d.readHDF5(path, "/data")
%     data = quant4d.readHDF5(path, "/data", ScanSize=[rx ry], Binning=2)
%
% Parameters:
%     path (str) : HDF5 file
%     dataset (str) : dataset path inside the file
%     ScanSize ([int int]) : scan size [rx ry] for 3-D datasets; guessed with
%         quant4d.guessScanShape if not given
%     PixelStart, NumPixels, Binning, FrameStart, NumFrames, Sampling, Progress :
%         as in quant4d.readRaw
%
% Returns:
%     data (single | double) : (kx, ky, rx, ry) array, or [] if cancelled
%     cancelled (bool) : true if Progress returned false
arguments
    path {mustBeTextScalar}
    dataset {mustBeTextScalar}
    opts.ScanSize (1,2) double = [NaN NaN]
    opts.PixelStart (1,2) double {mustBePositive} = [1 1]
    opts.NumPixels (1,2) double = [NaN NaN]
    opts.Binning (1,1) double {mustBeInteger, mustBePositive} = 1
    opts.FrameStart (1,2) double {mustBePositive} = [1 1]
    opts.NumFrames (1,2) double = [NaN NaN]
    opts.Sampling (1,1) double {mustBeInteger, mustBePositive} = 1
    opts.Progress = []
end

info = h5info(path, dataset);
sz = info.Dataspace.Size;
cls = quant4d.internal.hdf5Class(info.Datatype);
outType = quant4d.internal.outputClass(cls);

switch numel(sz)
    case 4
        scan = sz(3:4);
    case 3
        scan = opts.ScanSize;
        if any(isnan(scan))
            scan = quant4d.guessScanShape(sz(3));
        end
        if prod(scan) ~= sz(3)
            error('quant4d:readHDF5:scan', 'ScanSize [%d %d] does not hold the %d frames in %s.', ...
                  scan, sz(3), dataset);
        end
    otherwise
        error('quant4d:readHDF5:rank', '%s has %d dimensions; expected 3 or 4.', dataset, numel(sz));
end

[kx, ~, nPix] = quant4d.internal.pixelIndices(sz(1:2), opts.PixelStart, opts.NumPixels, opts.Binning);
[rx, ry, nFr] = quant4d.internal.frameIndices(scan, opts.FrameStart, opts.NumFrames, opts.Sampling);
pixCount = nPix*opts.Binning;
s = opts.Sampling;

data = zeros([nPix nFr], outType);
cancelled = false;

% one h5read per scan row: few calls, and only the selected frames are transferred
for j = 1:numel(ry)
    if numel(sz) == 4
        rows = h5read(path, dataset, [kx(1) opts.PixelStart(2) rx(1) ry(j)], ...
                      [pixCount numel(rx) 1], [1 1 s 1]);
        rows = reshape(rows, pixCount(1), pixCount(2), numel(rx));
    else
        first = (ry(j) - 1)*scan(1) + rx(1);
        rows = h5read(path, dataset, [kx(1) opts.PixelStart(2) first], ...
                      [pixCount numel(rx)], [1 1 s]);
    end
    rows = cast(rows, outType);
    for i = 1:numel(rx)
        data(:, :, i, j) = quant4d.internal.bin(rows(:, :, i), opts.Binning);
    end

    if ~isempty(opts.Progress)
        tf = opts.Progress(j, numel(ry));
        if ~isempty(tf) && ~tf
            cancelled = true;
            data = [];
            return
        end
    end
end
end
