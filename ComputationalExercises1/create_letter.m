%% creates the letter S

function[xx, yy] = create_letter(x, y, size)

% store length of knot arrays
n = length(x);

%store data in an 2*n matrix
data = [x', y'];

% get parametric coordinates
t = [0:1:n-1];

% get inteprolation values
tt = [0:0.01:n-1];

%interpolate
xx = spline(t, x, tt);
yy = spline(t, y, tt);

%resize
xx = size * xx;
yy = size * yy

end