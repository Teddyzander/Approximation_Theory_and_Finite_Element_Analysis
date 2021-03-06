%% visualisation of a cubic spline approximation of a sample data set

% get some data
x1=[-3,-2,-1,-.5,0,0.5,1,2,3]; % x values
f1_eval=[-1,-1,-1,-0.5,0,0.5,1,0.75,0.75]; %function values for each x

% plot a figure of these (figure 1)
figure(1)
plot(x1, f1_eval, 'ro')
axis square
axis([-3, 3, -1.5, 1.5])
title('function values for Q1')
legend('data')
shg

% get inteprolation evaluation points
t1 = [-3:0.01:3];

% do a piecewise cubic hermite interpolation
% p-chip is a shape preserving piecewise interpolation
% if f(x_{k})=f(x_{k+1}, then df(f(x_{k})/dx=df(f(x_{k+1})/dx
p1 = pchip(x1, f1_eval, t1);

% use cubic splint to estimate behaviour of the function
s1 = spline(x1, f1_eval, t1);

% make plot of interpolated data
figure(2)
plot(x1, f1_eval, 'ro', t1, p1, '-b', t1, s1, '-k')
axis square
axis([-3, 3, -1.5, 1.5])
title('spline approximations for Q1')
legend('data','Hermite spline','standard spline', ...
'location','northwest')

%% use spline to estimate e^{-2x} * sin(1-*pi*x) over [0, 1]
% using 20 intervals

%define intervals, evaluation points, and interpolations between points
a2 = 0; b2 = 1; c2 = 20; d2 = 10;

% define function
f2 = @(x) exp(-2.*x).*sin(10.*pi.*x);

% create interval and evaluate points
x2 = [a2:(b2-a2)/c2:b2];
f2_eval = f2(x2);

% get inteprolation evaluation points and use cubic spline to estimate f
t2 = [a2:(b2-a2)/(c2*d2):b2];
s2 = spline(x2, f2_eval, t2);

% plot the knots and the estimated curve
figure(3)
plot(x2, f2_eval, 'ro', t2, s2, '-k')
axis square
xlim([0, 1]);
title('spline approximations for Q2')
legend('data', 'standard spline', ...
'location','northwest')

%% use the spline function to create the letter s
% get knots for letter S
x_3 = [1,2,3,2,1.2,2,2.7];
y_3 = [1,0,1,2.5,3.4,4,3.2];

[xx_s, yy_s] = create_letter(x_3, y_3, 1);

figure(4)
plot(xx_s, yy_s)
title('Letter S')

%% use new knots to create another mystery letter! Also test size change

% get knots
x_4 = [3, 1.75, 0.9, 0, 0.5, 1.5, 3.25, 4.25, 4.25, 3, 3.75, 6.00];
y_4 = [4, 1.60, 0.5, 0, 1.0, 0.5, 0.50, 2.25, 4.00, 4, 3.25, 4.25];

[xx_myst, yy_myst] = create_letter(x_4, y_4, 1);
[xx_myst2, yy_myst2] = create_letter(x_4, y_4, 2);

figure(5)
plot(xx_myst, yy_myst, '-b', xx_myst2, yy_myst2, '-k')
title('Mystery Letter (script letter D)')

% it's a sciprt letter 'D'!








