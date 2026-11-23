function v = segmentCentroids(nseg, nrung, r_in, r_out, rotation_deg)
%SEGMENTCENTROIDS Nominal centre of mass of every DPC segment, in detector pixels.
%
% Rows are ordered like quant4d.segmentMasks. The centroid of an annular sector of
% half-angle a (radians) between radii r1 and r2 is
% 2 sin(a) / (3 a) * (r2^3 - r1^3) / (r2^2 - r1^2).
% Replaces the app's inline calculation, which divided by the half-angle in degrees
% (DPC magnitudes about 57 times too small) and applied the detector rotation twice.
%
% Usage::
%
%     v = quant4d.segmentCentroids(nseg, nrung, rIn, rOut, rotationDeg)
%
% Parameters:
%     nseg (int) : segments per ring
%     nrung (int) : number of rings
%     rIn (double) : inner radius in pixels
%     rOut (double) : outer radius in pixels
%     rotationDeg (double) : detector rotation in degrees
%
% Returns:
%     v (double) : nseg*nrung x 2 centroid vectors [x y]
arguments
    nseg (1,1) double {mustBeInteger, mustBeGreaterThanOrEqual(nseg, 2)}
    nrung (1,1) double {mustBeInteger, mustBePositive}
    r_in (1,1) double {mustBeNonnegative}
    r_out (1,1) double {mustBeNonnegative}
    rotation_deg (1,1) double = 0
end

a = pi/nseg;                                    % half angular span, radians
t = rotation_deg + (0:nseg - 1).'*360/nseg;     % segment centre angles, degrees
v = zeros(nseg*nrung, 2);
for j = 1:nrung
    r1 = r_in + (j - 1)*(r_out - r_in)/nrung;
    r2 = r_in + j*(r_out - r_in)/nrung;
    if r2 == r1
        radial = 1.5*r1;                        % limit of (r2^3-r1^3)/(r2^2-r1^2)
    else
        radial = (r2^3 - r1^3)/(r2^2 - r1^2);
    end
    rc = 2*sin(a)/(3*a)*radial;
    v(nseg*(j - 1) + (1:nseg), :) = rc*[cosd(t) sind(t)];
end
end
