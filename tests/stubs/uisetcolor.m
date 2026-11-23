function varargout = uisetcolor(varargin)
%UISETCOLOR  Test stub. Outside a test run it calls the real uisetcolor. In a test it returns
%   the queued "color" ([r g b]), else the current colour (= cancel).
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("uisetcolor", varargin{:});
    return
end
current = [0 0 0];
if nargin && isnumeric(varargin{1}), current = varargin{1}; end
c = q4dtest.dialogs("next", "color", current);
q4dtest.dialogs("log", "color", mat2str(c), "uisetcolor");
varargout{1} = c;
end
