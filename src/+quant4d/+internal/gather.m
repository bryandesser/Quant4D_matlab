function x = gather(x)
%GATHER  gather() for gpuArray, identity otherwise (works without PCT).
if isa(x, 'gpuArray')
    x = gather(x);
end
end
