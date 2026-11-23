function k = binRange(edges, rIn, rOut)
%BINRANGE Rings from quant4d.radialBins that lie wholly inside [rIn, rOut].
%
% With radii on multiples of the ring width (the app rounds them to AnnularStep)
% this selects exactly rIn <= r < rOut. Replaces the round(...)+1 indexing in the
% app's move_annular_detector, which also summed the ring starting at the outer
% radius.
%
% Usage::
%
%     k = quant4d.binRange(edges, rIn, rOut)
%
% Parameters:
%     edges (double) : ring edges from quant4d.radialBins
%     rIn (double) : inner radius in pixels
%     rOut (double) : outer radius in pixels
%
% Returns:
%     k (int) : indices of the selected rings
arguments
    edges (1,:) double
    rIn (1,1) double
    rOut (1,1) double
end
tol = 1e-6*(edges(2) - edges(1));
k = find(edges(1:end-1) >= rIn - tol & edges(2:end) <= rOut + tol);
end
