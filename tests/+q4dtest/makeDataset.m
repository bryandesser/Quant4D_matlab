function data = makeDataset(nfx, nfy, npx, npy, seed)
%MAKEDATASET  Synthetic 4D-STEM dataset in Quant4D's layout: (kx, ky, rx, ry), single.
%
%   A bright disc that drifts with probe position (so CoM has a known, constant gradient)
%   on a 5 % noise floor. Same geometry as make_dataset() in the Python tests/conftest.py:
%   a deliberately NON-SQUARE scan of NON-SQUARE patterns, so any x/y swap shows up.
%
%   Written to disk with q4dtest.writeRaw it is byte-compatible with the Python fixture
%   (frames contiguous, kx fastest), apart from the noise (different RNGs).
arguments
    nfx (1,1) double {mustBeInteger, mustBePositive} = 6
    nfy (1,1) double {mustBeInteger, mustBePositive} = 4
    npx (1,1) double {mustBeInteger, mustBePositive} = 24
    npy (1,1) double {mustBeInteger, mustBePositive} = 16
    seed (1,1) double = 42
end

rng(seed, "twister");
[xx, yy] = ndgrid(0:npx - 1, 0:npy - 1);
data = 0.05*rand(npx, npy, nfx, nfy, "single");
for ry = 0:nfy - 1
    for rx = 0:nfx - 1
        disc = hypot(xx - (0.58*npx + 0.3*rx), yy - (0.4*npy + 0.3*ry)) < 0.25*npy;
        data(:, :, rx + 1, ry + 1) = data(:, :, rx + 1, ry + 1) + single(disc);
    end
end
end
