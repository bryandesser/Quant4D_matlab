function R = rotation(deg)
%ROTATION  The app's rotation_matrix: row vector v*R is v rotated by +deg.
R = [cosd(deg), sind(deg); -sind(deg), cosd(deg)];
end
