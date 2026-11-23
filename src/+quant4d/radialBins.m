function [bins, edges] = radialBins(nPixels, center, stepPx, maxRadius)
%RADIALBINS Ring masks of equal width around the beam centre, for fast BF/ADF imaging.
%
% Pixel p is in ring k when edges(k) <= r(p) < edges(k+1), with r measured from the
% centre. Multiplying the rings by the data once gives a stack of ring images; any
% annular image is then a sum of rings, chosen with quant4d.binRange so it equals
% the drawn mask exactly.
%
% Usage::
%
%     [bins, edges] = quant4d.radialBins([kx ky], [x y], stepPx, maxRadius)
%     k = quant4d.binRange(edges, r_in, r_out);
%     mask = reshape(any(bins(k, :), 1), [kx ky]);
%
% Parameters:
%     nPixels ([int int]) : detector size [kx ky]
%     center ([double double]) : beam centre [x y] in pixels, 1-based
%     stepPx (double) : ring width in pixels
%     maxRadius (double) : largest radius to cover
%
% Returns:
%     bins (logical) : one row per ring, one column per detector pixel
%     edges (double) : ring edges 0, stepPx, 2*stepPx, ... past maxRadius
arguments
    nPixels (1,2) double {mustBeInteger, mustBePositive}
    center (1,2) double
    stepPx (1,1) double {mustBePositive}
    maxRadius (1,1) double {mustBeNonnegative}
end
[x, y] = ndgrid(1:nPixels(1), 1:nPixels(2));
r = hypot(x(:) - center(1), y(:) - center(2));

nBins = floor(maxRadius/stepPx) + 1;            % last ring holds r == maxRadius too
edges = (0:nBins)*stepPx;
k = floor(r/stepPx) + 1;
inside = k <= nBins;

bins = false(nBins, prod(nPixels));
bins(sub2ind(size(bins), k(inside), find(inside))) = true;
end
