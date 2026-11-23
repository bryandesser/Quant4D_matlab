function [kx, ky, nOut] = pixelIndices(total, start, nOut, binning)
%PIXELINDICES  Detector pixels to read for a crop + binning.
%   total [kx ky] detector size, start [kx ky] first pixel, nOut [kx ky] output pixels after
%   binning (NaN = as many as fit). kx/ky are the file pixel indices (before binning).
for a = 1:2
    if isnan(nOut(a))
        nOut(a) = floor((total(a) - start(a) + 1)/binning);
    end
end
last = start + nOut*binning - 1;
if any(nOut < 1) || any(last > total)
    error('quant4d:range', ['Detector range [%d %d] + %d x [%d %d] pixels (binning %d) ' ...
          'does not fit a %d x %d detector.'], start, binning, nOut, binning, total);
end
kx = start(1):last(1);
ky = start(2):last(2);
end
