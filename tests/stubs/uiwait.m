function uiwait(varargin)
%UIWAIT  Test stub. Outside a test run it calls the real uiwait. In a test, dialogs are
%   answered instantly, so "wait until closed" means "close it now"; deleting fires the
%   dialog's DeleteFcn exactly as a user close would.
if ~q4dtest.dialogs("active")
    q4dtest.callReal("uiwait", varargin{:});
    return
end
if nargin && ~isempty(varargin{1}) && all(isgraphics(varargin{1}))
    delete(varargin{1});
end
end
