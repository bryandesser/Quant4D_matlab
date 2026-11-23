function [icom, dcom] = integrateCoM(comx, comy, band)
%INTEGRATECOM Integrated (iCoM/iDPC) and differentiated (dCoM/dDPC) images of a CoM field.
%
% Lazic et al., Ultramicroscopy 160 (2016) 265, doi:10.1016/j.ultramic.2015.10.011.
% Replaces the app's inline calculation, which put the zero frequency at n/2+0.5,
% used un-normalised frequencies (so non-square scans were integrated
% anisotropically) and took its band-pass limits from the diffraction pattern.
%
% Usage::
%
%     [icom, dcom] = quant4d.integrateCoM(comx, comy)
%     [icom, dcom] = quant4d.integrateCoM(comx, comy, quant4d.periodsToBand([2 200]))
%
% Parameters:
%     comx (double) : CoM x component [rx ry]
%     comy (double) : CoM y component [rx ry]
%     band ([double double]) : band-pass on the spatial frequency in cycles per
%         pixel, 0 to sqrt(2)/2; default [0 Inf], no filter
%
% Returns:
%     icom (double) : integrated CoM [rx ry], zero mean
%     dcom (double) : divergence of the CoM field [rx ry]
arguments
    comx (:,:) {mustBeNumeric}
    comy (:,:) {mustBeNumeric, mustBeEqualSize(comx, comy)}
    band (1,2) double = [0 Inf]
end

[nx, ny] = size(comx);
kx = ifftshift((0:nx - 1) - floor(nx/2)).' / nx;   % cycles/pixel, k = 0 at index 1
ky = ifftshift((0:ny - 1) - floor(ny/2)) / ny;
[KX, KY] = ndgrid(kx, ky);
k2 = KX.^2 + KY.^2;
tol = 1e-9;                       % so a cut exactly at a grid frequency keeps that frequency
pass = sqrt(k2) >= band(1)*(1 - tol) & sqrt(k2) <= band(2)*(1 + tol);

num = (KX.*fft2(comx) + KY.*fft2(comy)) .* pass;

k2(1, 1) = 1;                     % DC carries no gradient information
F = num ./ (2i*pi*k2);
F(1, 1) = 0;
icom = real(ifft2(F));

dcom = real(ifft2(2i*pi*num));
end

function mustBeEqualSize(a, b)
if ~isequal(size(a), size(b))
    error("quant4d:integrateCoM:size", "comx and comy must be the same size.");
end
end
