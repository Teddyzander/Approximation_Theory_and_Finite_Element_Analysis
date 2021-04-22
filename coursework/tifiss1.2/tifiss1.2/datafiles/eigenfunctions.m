%% run problem solver
ell_adiff;
%% get eigen values and vectors 
[eigvec, eigval]  = eigs(A, M, 6, 'smallestabs');
eigval(1, 1)
eigval(2, 2)
eigval(3, 3)
length(x_gal)


%% plot eigen functions
xv = min(xy(:, 1)):0.01:max(xy(:, 1))
yv = min(xy(:, 2)):0.01:max(xy(:, 2))
[X, Y] = meshgrid(xv, yv);
for n=1:6
    figure(2)
    subplot(2, 3, n)
    u = griddata(xy(:, 1), xy(:, 2), eigvec(:, n), X, Y, 'cubic');
    u(1:99, 1:99) = NaN;
    contourf(X, Y, u)
    xlabel('$x$', 'interpreter', 'Latex')
    ylabel('$y$', 'interpreter', 'Latex')
end
subplot(2, 3, 1)