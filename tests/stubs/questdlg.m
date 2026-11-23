function varargout = questdlg(varargin)
%QUESTDLG  Test stub (shadows MATLAB's questdlg while tests/stubs is on the path).
%   Outside a test run (q4dtest.dialogs inactive) it calls the real questdlg.
%   In a test it never blocks: it returns the next answer queued with
%   q4dtest.dialogs("queue","quest",...), otherwise the default button (last argument).
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("questdlg", varargin{:});
    return
end
args = [varargin, {"", ""}];
q4dtest.dialogs("log", "quest", args{1}, args{2});

default = 'Yes';
if numel(varargin) > 2
    default = varargin{end};
    if isstruct(default) && numel(varargin) > 3   % trailing options struct
        default = varargin{end - 1};
    end
end
varargout{1} = char(q4dtest.dialogs("next", "quest", default));
end
