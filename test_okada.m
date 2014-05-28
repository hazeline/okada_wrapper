source_depth = 3.0;
obs_depth = 3.0;
poisson_ratio = 0.25;
mu = 1.0;
dip = 90;
lambda = 2 * mu * poisson_ratio / (1 - 2 * poisson_ratio);
alpha = (lambda + mu) / (lambda + 2 * mu);
x = linspace(-1, 1, 100);
y = linspace(-1, 1, 100);
ux = zeros(100, 100);
for i = 1:100
    for j = 1:100
        [success, u, grad_u] = DC3Dwrapper(alpha,...
                                           [x(i), y(j), -obs_depth],...
                                           [0.0, 0.0, -source_depth],...
                                           dip, [1.0, 0.0, 0.0, 0.0]);

        ux(i, j) = u(1);
    end
end
contourf(x, y, log(ux))
xlabel('x')
ylabel('y')
colorbar()