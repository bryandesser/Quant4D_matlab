function varargout = callReal(name, varargin)
%CALLREAL  Call MATLAB's own dialog function `name`, bypassing the stub that shadows it.
%   Used by tests/stubs when the stubs are inactive (i.e. outside a test run).
stubs = fullfile(q4dtest.AppTestCase.repoRoot(), "tests", "stubs");
if any(strcmpi(strsplit(path, pathsep), stubs))
    rmpath(stubs);
    restore = onCleanup(@() addpath(stubs));   % put the stubs back on top afterwards
end
[varargout{1:nargout}] = feval(name, varargin{:});
end
