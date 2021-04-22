verts = [225, 833, 3201, 12545, 49665];
lin_e = [1.599e-1, 8.971e-2, 5.067e-2, 2.9108e-2, 1.7072e-2];
lin_q = [3.8918e-2, 2.3848e-2, 1.4941e-2, 9.4021e-3, NaN]
openfig('refinementpath.fig')
hold on
x=[0:1:10e5];
loglog(verts, lin_e, 'r-o')
hold on
loglog(verts, lin_q, 'g-o')

title('Energy errors')
legend('Energy error estimate for adaptive grid', '1/N-1', ...
    'Energy error estimate for linear interpolation uniform grid', ...
    'Energy error estimate for quadratic interpolation uniform grid', ...
    'Location', 'Southeast')