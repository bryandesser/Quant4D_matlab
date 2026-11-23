function [comx, comy] = dpcCoM(data, segMasks, annularMask, centroids, nFrames, scanRotationDeg)
%DPCCOM Centre-of-mass estimate from a segmented (DPC) detector.
%
% Each segment's signal is divided by the total in the annulus and weighted by its
% centroid. With many segments and rungs this converges to quant4d.centerOfMass
% with the same annulus.
%
% Usage::
%
%     [comx, comy] = quant4d.dpcCoM(data, segMasks, annularMask, centroids, nFrames, scanDeg)
%
% Parameters:
%     data (array) : prod(nPixels) x prod(nFrames), as app.data (CPU or gpuArray)
%     segMasks (logical) : from quant4d.segmentMasks
%     annularMask (logical) : [kx ky] full annulus, for normalisation
%     centroids (double) : from quant4d.segmentCentroids, same rotation as the masks
%     nFrames ([int int]) : scan size [rx ry]
%     scanRotationDeg (double) : scan rotation, applied once to the result
%
% Returns:
%     comx (double | single) : [rx ry] x component in detector pixels
%     comy (double | single) : [rx ry] y component; multiply by mrad/px for mrad
arguments
    data {mustBeNumeric}
    segMasks {mustBeNumericOrLogical}
    annularMask {mustBeNumericOrLogical}
    centroids (:,2) double
    nFrames (1,2) double {mustBeInteger, mustBePositive}
    scanRotationDeg (1,1) double = 0
end
w = cast([double(annularMask(:)).'; double(segMasks)], quant4d.internal.dataClass(data));
signals = quant4d.internal.gather(w*data);                       % (1 + segments) x frames
fractions = signals(2:end, :)./signals(1, :);
com = (fractions.' * centroids) * quant4d.internal.rotation(scanRotationDeg);
comx = reshape(com(:, 1), nFrames);
comy = reshape(com(:, 2), nFrames);
end
