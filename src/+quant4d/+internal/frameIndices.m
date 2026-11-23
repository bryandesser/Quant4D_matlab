function [rx, ry, nOut] = frameIndices(total, start, nOut, sampling)
%FRAMEINDICES  Probe positions to read for a crop + sub-sampling.
%   Every sampling-th position from start: start, start+s, ... (the semantics the Import and
%   Export panels describe, and that export_data and the pre-Aug-2025 reader used).
for a = 1:2
    if isnan(nOut(a))
        nOut(a) = floor((total(a) - start(a))/sampling) + 1;
    end
end
last = start + (nOut - 1)*sampling;
if any(nOut < 1) || any(last > total)
    error('quant4d:range', ['Scan range from [%d %d], %d x %d positions every %d, ' ...
          'does not fit a %d x %d scan.'], start, nOut, sampling, total);
end
rx = start(1):sampling:last(1);
ry = start(2):sampling:last(2);
end
