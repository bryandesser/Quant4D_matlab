function scan = guessScanShape(n)
%GUESSSCANSHAPE Scan size [rx ry] with rx*ry == n, as close to square as possible.
%
% Replaces the app's guess_frames_from_dim3, whose round(sqrt(n)) guess need not
% multiply back to n (24 gave 5 x 5).
%
% Usage::
%
%     quant4d.guessScanShape(24)      % [6 4]
%     quant4d.guessScanShape(4096)    % [64 64]
%
% Parameters:
%     n (int) : number of probe positions
%
% Returns:
%     scan ([int int]) : [rx ry] with rx >= ry
arguments
    n (1,1) double {mustBeInteger, mustBePositive}
end
ry = floor(sqrt(n));
while mod(n, ry) ~= 0
    ry = ry - 1;
end
scan = [n/ry ry];
end
