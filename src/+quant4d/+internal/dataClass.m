function c = dataClass(data)
%DATACLASS  Numeric class of data, looking through gpuArray.
if isa(data, 'gpuArray')
    c = classUnderlying(data);
else
    c = class(data);
end
end
