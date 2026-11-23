function perm = axisPermutation(order)
%AXISPERMUTATION  File axis that holds each logical axis [kx ky rx ry].
%   logicalSize = fileSize(perm). Same table as import_box_input in the app.
switch char(order)
    case 'kr',     perm = [1 2 3 4];   % file (kx ky rx ry)
    case 'kr_inv', perm = [2 1 4 3];   % file (ky kx ry rx)
    case 'rk',     perm = [3 4 1 2];   % file (rx ry kx ky)
    case 'rk_inv', perm = [4 3 2 1];   % file (ry rx ky kx)
    otherwise
        error('quant4d:order', 'Unknown axis order ''%s''.', order);
end
end
