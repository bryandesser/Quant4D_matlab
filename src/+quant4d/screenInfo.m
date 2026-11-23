function info = screenInfo()
%SCREENINFO Screen size, usable work area and window-decoration sizes, without needing Java.
%
% Replaces the Java (java.awt / javax.swing) calls in the app's get_screen_info,
% which fail in MATLAB releases that ship without a Java runtime (R2026b by
% default). Uses Java when it is available, .NET on Windows otherwise, and fixed
% defaults as a last resort. All sizes are in MATLAB pixels.
%
% Usage::
%
%     info = quant4d.screenInfo()
%
% Returns:
%     info (struct) : fields screen_size, monitor_positions, screen_pixel_scale,
%         title_height, decor_height, decor_width and screen_avail
%         ([left bottom width height] of the main screen excluding the taskbar),
%         plus source ("java", "dotnet" or "default")

info.screen_size = get(groot, 'ScreenSize');
info.monitor_positions = get(groot, 'MonitorPositions');

% Defaults: typical Windows 10/11 title bar and resize border at 100 % scaling
info.screen_pixel_scale = 1;
info.title_height = 31;
info.decor_height = 39;
info.decor_width = 16;
info.screen_avail = info.screen_size;
info.source = "default";

if usejava('awt')
    try
        info = fromJava(info);
        return
    catch
    end
end
if ispc
    try
        info = fromDotNet(info);
        return
    catch
    end
end
if ismac
    % Menu bar at the top; the Dock is ignored
    info.title_height = 28;
    info.decor_height = 28;
    info.decor_width = 0;
    info.screen_avail = [1 1 info.screen_size(3) info.screen_size(4) - 25];
end
end

function info = fromJava(info)
tk = java.awt.Toolkit.getDefaultToolkit();
scale = info.screen_size(4) / tk.getScreenSize().height;
jf = javax.swing.JFrame('Test');
jf.setDefaultCloseOperation(javax.swing.JFrame.DISPOSE_ON_CLOSE);
jf.pack();
ins = jf.getInsets();   % not accurate on Windows, due to the transparent shadow
info.title_height = ins.top * scale;
info.decor_height = info.title_height + ins.bottom * scale;
info.decor_width = (ins.left + ins.right) * scale;
ins = tk.getScreenInsets(jf.getGraphicsConfiguration());
jf.dispose();
ins = [ins.left, ins.bottom, ins.right + ins.left, ins.top + ins.bottom] * scale;
info.screen_avail = [ins(1:2) + 1, info.screen_size(3:4) - ins(3:4)];
info.screen_pixel_scale = scale;
info.source = "java";
end

function info = fromDotNet(info)
NET.addAssembly('System.Windows.Forms');
scr = System.Windows.Forms.Screen.PrimaryScreen;
b = scr.Bounds;
a = scr.WorkingArea;
scale = info.screen_size(4) / double(b.Height);
si = System.Windows.Forms.SystemInformation;
caption = double(si.CaptionHeight);
border = double(si.FrameBorderSize.Height) + double(si.BorderSize.Height);
info.title_height = (caption + border) * scale;
info.decor_height = (caption + 2 * border) * scale;
info.decor_width = 2 * (double(si.FrameBorderSize.Width) + double(si.BorderSize.Width)) * scale;
% .NET measures from the top left; MATLAB from the bottom left
left = double(a.X - b.X);
bottom = double((b.Y + b.Height) - (a.Y + a.Height));
info.screen_avail = [[left bottom] * scale + 1, [double(a.Width) double(a.Height)] * scale];
info.screen_pixel_scale = scale;
info.source = "dotnet";
end
