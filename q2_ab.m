



% display code
type('rectrap.m');
type('compguassquad.m')

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


% quadrature
n = (evals + 1) / 2;
n = floor(n);

result = compguassquad(f, a, b, n);

fprintf(' Composite Gauss Quadrature\n');
fprintf('The value of the integral is %f\n', result);
fprintf('The number of function evaluations is %d\n', n);


% the real value is given by erf(3) 
correct_val = erf(3);
fprintf('The correct value is %.10f\n', correct_val);
% the computed values
fprintf('The value of the integral using the trapezoidal rule is %.10f\n', S_t);
fprintf('The value of the integral using the composite Gauss Quadrature is %.10f\n', result);
% the error of both is given by 
fprintf('The error of the trapezoidal rule is %.10f\n', abs(correct_val - S_t));
fprintf('The error of the composite Gauss Quadrature is %.10f\n', abs(correct_val - result));

% we can see the composite Gauss Quadrature  converges faster than the trapezoidal rule
% because we needed much less function evaluations to get the same error



