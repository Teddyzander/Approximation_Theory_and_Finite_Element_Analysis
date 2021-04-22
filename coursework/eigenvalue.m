lambdas = [2.0766e-11, 1.4762, 3.5341];
u = @(lam, x, y) sin(sqrt(lam)*x)*sin(sqrt(lam)*y);
x1=[-1:0.01:1];
y1=[-1:0.01:1];
figure(1)
title("Eigenfunction plots for first 3 Eigenvalues")
for n=1:length(lambdas)
    us = zeros(length(x1), length(y1));
    for i=1:length(x1)
        for j=1:length(y1)
            us(i, j) = u(lambdas(n), x1(i), y1(j));
        end
    end
    subplot(length(lambdas), 1, n);
    if n==1
        title("Eigenfunction plots for first 3 Eigenvalues")
    end
    [X, Y] = meshgrid(x1, y1);
    us(1:100,1:100) = 0;
    contour(X, Y, us);
    hold on
    shading interp
    xlabel('$x$', 'interpreter', 'Latex')
    ylabel('$y$', 'interpreter', 'Latex')
    colorbar
end
subplot(3, 1, 1)
title("Eigenfunction plots for first 3 Eigenvalues")