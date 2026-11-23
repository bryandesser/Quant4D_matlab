function [comx, comy] = centerOfMass(data, mask, center, nFrames, opts)
%CENTEROFMASS Centre-of-mass images from a masked detector ("Center of Mass" mode).
%
% Same maths as the "CoM" branch of the app's integrate_CoM. Frames with no counts
% inside the mask give NaN.
%
% Usage::
%
%     [comx, comy] = quant4d.centerOfMass(data, mask, center, nFrames)
%     [comx, comy] = quant4d.centerOfMass(..., FlipY=true, ScanRotation=deg)
%
% Parameters:
%     data (array) : prod(nPixels) x prod(nFrames), as app.data (CPU or gpuArray)
%     mask (logical | double) : detector weights [kx ky], normally the annular mask
%     center ([double double]) : beam centre [x y] in detector pixels
%     nFrames ([int int]) : scan size [rx ry]
%     FlipY (bool) : mirror detector y before rotating
%     ScanRotation (double) : rotate the vectors by this angle in degrees, using the
%         app's rotation_matrix convention
%
% Returns:
%     comx (double | single) : [rx ry] x component, in detector pixels from the centre
%     comy (double | single) : [rx ry] y component; multiply by mrad/px for mrad
arguments
    data {mustBeNumeric}
    mask {mustBeNumericOrLogical}
    center (1,2) double
    nFrames (1,2) double {mustBeInteger, mustBePositive}
    opts.FlipY (1,1) logical = false
    opts.ScanRotation (1,1) double = 0
end
nPixels = size(mask);
[x, y] = ndgrid((1:nPixels(1)) - center(1), (1:nPixels(2)) - center(2));
if opts.FlipY
    y = -y;
end
m = double(mask(:));
w = cast([m, x(:).*m, y(:).*m].', quant4d.internal.dataClass(data));

moments = quant4d.internal.gather(w*data);                       % 3 x frames
com = (moments(2:3, :)./moments(1, :)).' * quant4d.internal.rotation(opts.ScanRotation);
comx = reshape(com(:, 1), nFrames);
comy = reshape(com(:, 2), nFrames);
end
