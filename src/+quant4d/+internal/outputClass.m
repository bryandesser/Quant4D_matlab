function c = outputClass(dtype)
%OUTPUTCLASS  Floating-point class Quant4D computes in for stored class dtype:
%   double for 64-bit types, single otherwise (as the app's dtype1).
if quant4d.internal.byteSize(dtype) > 4
    c = 'double';
else
    c = 'single';
end
end
