function path = writeRaw(path, data, opts)
%WRITERAW  Write a (kx, ky, rx, ry) array as a binary file Quant4D can import.
%
%   q4dtest.writeRaw(path, data, Precision="uint16", ByteOrder="b", Header=16, Footer=1024)
%
%   Order    "kr"     frames contiguous, kx fastest: file axes (kx ky rx ry)  [default]
%            "kr_inv" file axes (ky kx ry rx)
%            "rk"     probe positions contiguous: file axes (rx ry kx ky)
%            "rk_inv" file axes (ry rx ky kx)
%   Header/Footer are bytes before/after each block of the two fastest file axes;
%   Offset is bytes at the start of the file. Same layout rules as quant4d.readRaw.
arguments
    path (1,1) string
    data {mustBeNumeric}
    opts.Precision (1,1) string = "single"
    opts.ByteOrder (1,1) string {mustBeMember(opts.ByteOrder, ["l" "b"])} = "l"
    opts.Header (1,1) double {mustBeNonnegative} = 0
    opts.Footer (1,1) double {mustBeNonnegative} = 0
    opts.Offset (1,1) double {mustBeNonnegative} = 0
    opts.Order (1,1) string {mustBeMember(opts.Order, ["kr" "kr_inv" "rk" "rk_inv"])} = "kr"
end

switch opts.Order
    case "kr",     blocks = data;
    case "kr_inv", blocks = permute(data, [2 1 4 3]);
    case "rk",     blocks = permute(data, [3 4 1 2]);
    case "rk_inv", blocks = permute(data, [4 3 2 1]);
end
bs = size(blocks, 1:4);

fid = fopen(path, "w", char(opts.ByteOrder));
assert(fid > 0, "q4dtest:writeRaw:open", "Cannot open %s for writing.", path);
closer = onCleanup(@() fclose(fid));

precision = char(opts.Precision);
fwrite(fid, zeros(1, opts.Offset, "uint8"), "uint8");
for b = 1:bs(3)*bs(4)
    fwrite(fid, zeros(1, opts.Header, "uint8"), "uint8");
    fwrite(fid, blocks(:, :, b), precision);
    fwrite(fid, zeros(1, opts.Footer, "uint8"), "uint8");
end
end
