function masks = segmentMasks(nPixels, center, nseg, nrung, rIn, rOut, rotationDeg, flipY)
%SEGMENTMASKS Masks of a segmented (DPC) detector: nseg segments times nrung rings.
%
% Same masks as the "DPC" branch of the app's integrate_CoM (app.masks.Seg). Use with
% quant4d.segmentCentroids and quant4d.dpcCoM.
%
% Usage::
%
%     masks = quant4d.segmentMasks([kx ky], [x y], nseg, nrung, rIn, rOut, rotationDeg, flipY)
%
% Parameters:
%     nPixels ([int int]) : detector size [kx ky]
%     center ([double double]) : beam centre [x y] in pixels
%     nseg (int) : segments per ring
%     nrung (int) : number of rings ("rungs")
%     rIn (double) : inner radius in pixels
%     rOut (double) : outer radius in pixels
%     rotationDeg (double) : detector rotation; segment i is centred on
%         rotationDeg + (i-1)*360/nseg
%     flipY (bool) : mirror detector y first
%
% Returns:
%     masks (logical) : one row per segment, row nseg*(j-1)+i is segment i of rung j
arguments
    nPixels (1,2) double {mustBeInteger, mustBePositive}
    center (1,2) double
    nseg (1,1) double {mustBeInteger, mustBeGreaterThanOrEqual(nseg, 2)}
    nrung (1,1) double {mustBeInteger, mustBePositive}
    rIn (1,1) double {mustBeNonnegative}
    rOut (1,1) double {mustBeNonnegative}
    rotationDeg (1,1) double = 0
    flipY (1,1) logical = false
end
[x, y] = ndgrid((1:nPixels(1)) - center(1), (1:nPixels(2)) - center(2));
if flipY
    y = -y;
end
r2 = x(:).^2 + y(:).^2;
a = mod(atan2d(y(:), x(:)) - rotationDeg + 180/nseg, 360);   % segment 1 starts at 0

masks = false(nseg*nrung, prod(nPixels));
w = (rOut - rIn)/nrung;
for j = 1:nrung
    k1 = rIn + (j - 1)*w;
    k2 = rIn + j*w;
    inRung = r2 >= k1^2 & r2 < k2^2;
    for i = 1:nseg
        inSeg = a >= (i - 1)*360/nseg & a < i*360/nseg;
        masks(nseg*(j - 1) + i, :) = (inRung & inSeg).';
    end
end
end
