function n = byteSize(dtype)
%BYTESIZE  Bytes per element of a MATLAB numeric class name.
switch char(dtype)
    case {'int8', 'uint8'},                   n = 1;
    case {'int16', 'uint16'},                 n = 2;
    case {'int32', 'uint32', 'single'},       n = 4;
    case {'int64', 'uint64', 'double'},       n = 8;
    otherwise
        error('quant4d:dataType', 'Unsupported data type ''%s''.', dtype);
end
end
