function path = writeHDF5(path, data, dataset)
%WRITEHDF5  Write a (kx, ky, rx, ry) array to HDF5.
%   MATLAB writes column-major, so on disk this is C-order (ry, rx, ky, kx): the canonical
%   layout used by py4DSTEM and by sample_hdf5_file in the Python tests/conftest.py.
arguments
    path (1,1) string
    data {mustBeNumeric}
    dataset (1,1) string = "/data"
end
h5create(path, dataset, size(data), "Datatype", class(data));
h5write(path, dataset, data);
end
