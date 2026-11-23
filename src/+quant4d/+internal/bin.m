function out = bin(frame, b)
%BIN  Sum b x b blocks of a 2-D frame (size must be a multiple of b). NaNs count as 0.
if b == 1
    out = frame;
    return
end
frame(isnan(frame)) = 0;
[n1, n2] = size(frame);
out = reshape(sum(reshape(frame, b, n1/b, b, n2/b), 1), n1/b, b, n2/b);
out = reshape(sum(out, 2), n1/b, n2/b);
end
