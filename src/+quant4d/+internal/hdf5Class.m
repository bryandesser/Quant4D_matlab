function cls = hdf5Class(datatype)
%HDF5CLASS  MATLAB class name for an h5info Datatype struct (same rules as h5_datasets).
switch datatype.Class
    case 'H5T_FLOAT'
        if datatype.Size == 8
            cls = 'double';
        elseif datatype.Size == 4
            cls = 'single';
        else
            error('quant4d:readHDF5:type', '%d-byte floats are not supported.', datatype.Size);
        end
    case 'H5T_INTEGER'
        cls = sprintf('int%d', 8*datatype.Size);
        if contains(string(datatype.Type), "_U")      % e.g. H5T_STD_U16LE
            cls = ['u' cls];
        end
    otherwise
        error('quant4d:readHDF5:type', 'Unsupported HDF5 class %s.', datatype.Class);
end
end
