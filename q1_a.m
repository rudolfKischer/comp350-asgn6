

% display code
type('rectrap.m');
type('simpsons.m');
type('statError.m');

f = @statError;
a = 0;
b = 3;
n = 200;
err = 10^-5;
[S_t, error, evals] = rectrap(f, a, b, n, err);




fprintf(' Trapezoidal Rule\n');
fprintf('The value of the integral is %f\n', S_t);
fprintf('The number of function evaluations is %d\n', evals);
fprintf('The error is %f\n', error);


delta = 10^-5;
level_max = 50;
[numI, evals, error] = simpsons(f, a, b, delta, 0, level_max, 0);

fprintf(' Simpson''s Rule\n');
fprintf('The value of the integral is %f\n', numI);
fprintf('The number of function evaluations is %d\n', evals);
fprintf('The error is %f\n', error);



% quadrature
n = (evals + 1) / 2;
n = floor(n);

result = compguassquad(f, a, b, n);

fprintf(' Composite Gauss Quadrature\n');
fprintf('The value of the integral is %f\n', result);
fprintf('The number of function evaluations is %d\n', n);
