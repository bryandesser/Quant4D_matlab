function [scanDeg, flipY, curlScore] = minimizeCurl(comx, comy, scanDeg, flipY)
%MINIMIZECURL Scan rotation and y flip that make a CoM field curl-free.
%
% The CoM of a thin specimen is a gradient field, so the right scan rotation and
% flip make its curl vanish. The rotation is found to 0.1 degrees; the 180-degree
% ambiguity, which the curl cannot see, is resolved by preferring positive total
% divergence, as the app did. Replaces the app's minimize_curl: NaN frames no longer
% break it and the Mapping Toolbox is no longer needed.
%
% Usage::
%
%     [scanDeg, flipY] = quant4d.minimizeCurl(comx, comy, scanDeg, flipY)
%
% Parameters:
%     comx (double) : current CoM x image [rx ry], computed with the current settings
%     comy (double) : current CoM y image [rx ry]
%     scanDeg (double) : current scan rotation in degrees
%     flipY (bool) : current y flip
%
% Returns:
%     scanDeg (double) : scan rotation to use, -180 to 180 degrees
%     flipY (bool) : y flip to use
%     curlScore (double) : remaining mean absolute curl
arguments
    comx (:,:) double
    comy (:,:) double
    scanDeg (1,1) double = 0
    flipY (1,1) logical = false
end
if all(isnan(comx(:)) | isnan(comy(:)))
    error('quant4d:minimizeCurl:nan', 'The CoM images are all NaN; try a different detector.');
end
if any(size(comx) < 3)
    error('quant4d:minimizeCurl:size', 'Need at least 3 x 3 probe positions.');
end

% Candidate fields: current field rotated by phi, either as is or mirrored (cy -> -cy).
best = [Inf 0 0];                                       % [score phi toggle]
for toggle = 0:1
    cy = comy*(1 - 2*toggle);
    for phi = 0:179
        c = score(comx, cy, phi);
        if c < best(1)
            best = [c phi toggle];
        end
    end
end

toggle = best(3);
cy = comy*(1 - 2*toggle);
for phi = best(2) + (-1:0.1:1)
    c = score(comx, cy, phi);
    if c < best(1)
        best(1:2) = [c phi];
    end
end
phi = best(2);

% curl cannot tell phi from phi+180 (the field just changes sign): pick positive divergence
[fx, fy] = rotate(comx, cy, phi);
[~, d] = curlDiv(fx, fy);
if sum(d(~isnan(d))) < 0
    phi = phi + 180;
end

if toggle
    scanDeg = phi - scanDeg;   % cur*F*R(phi) == raw*F_new*R(new):  new = phi - old
    flipY = ~flipY;
else
    scanDeg = scanDeg + phi;
end
scanDeg = mod(scanDeg + 180, 360) - 180;
curlScore = best(1);
end

function c = score(fx, fy, phi)
[fx, fy] = rotate(fx, fy, phi);
cu = curlDiv(fx, fy);
c = mean(abs(cu(:)), 'omitnan');
end

function [rx, ry] = rotate(fx, fy, phi)
% row vector [fx fy] * rotation_matrix(phi)
rx = fx*cosd(phi) - fy*sind(phi);
ry = fx*sind(phi) + fy*cosd(phi);
end

function [curl, div] = curlDiv(fx, fy)
% x runs along dim 1, y along dim 2; gradient() returns d/d(dim 2) first
[dfx_dy, dfx_dx] = gradient(fx);
[dfy_dy, dfy_dx] = gradient(fy);
curl = dfy_dx - dfx_dy;
div = dfx_dx + dfy_dy;
end
