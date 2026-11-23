function varargout = listdlg(varargin)
%LISTDLG  Test stub. Outside a test run it calls the real listdlg; in a test it returns the
%   queued "list" answer (an index), default 1.
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("listdlg", varargin{:});
    return
end
prompt = "";
name = "";
for k = 1:2:numel(varargin) - 1
    switch lower(string(varargin{k}))
        case "promptstring", prompt = strjoin(string(varargin{k + 1}), newline);
        case "name",         name = string(varargin{k + 1});
    end
end
q4dtest.dialogs("log", "list", prompt, name);
indx = q4dtest.dialogs("next", "list", 1);
varargout = {indx, ~isempty(indx)};
end
