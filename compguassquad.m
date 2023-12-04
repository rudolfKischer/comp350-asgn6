function [result] = compguassquad(f, a, b, n)
%COMPGUASSQUAD 
%   This computes the composite guassian quadrature using the two point rul
% it is composite, because we compute the sum of the gauss quadrature over
% sub intervals
% we divide out interval into n sub intervals
% [xi, xi+1], i = 0, 1, 2, ..., n-1
% we then apply the two point gauss quadrature to each sub interval

% recall the two point quadrature rule is as follow
% int [-1, 1] f(x) dx = f(-sqrt(3)/3) + f(sqrt(3)/3)

% we need to map the interval [a, b] to [-1, 1]
% we do this by the following transformation
% x = (b-a)/2 * t + (b+a)/2
% dx = (b-a)/2 * dt
% we then have
% beta = (b-a)/2
% alpha = (b+a)/2
% int [a, b] f(x) dx = beta * int [-1, 1] f(beta * t + alpha) dt
% this is roughly equal to 
% beta *  sum [0,n] A_i * f(beta * t_i + alpha)

% for use and our two point quadrature rule this means we have

% beta = (b-a)/2
% alpha = (b+a)/2
% int [a, b] f(x) dx = beta * (f(beta * (-sqrt(3)/3) + alpha) + f(beta * (sqrt(3)/3) + alpha))

% we then need to compute the sum of the two point quadrature over the
% subintervals

% so we will our formula is 
% h = (b-a)/n
% beta_i = (x_i+1 - x_i)/2 = h/2
% alpha_i = (x_i+1 + x_i)/2 = a + i*h + h/2

% sum [0,n-1] int [xi, xi+1] f(x) dx = sum [0,n-1] beta_i * (f(beta_i * (-sqrt(3)/3) + alpha_i) + f(beta_i * (sqrt(3)/3) + alpha_i))

result = 0;

h = (b-a)/n;
beta = h/2;
beta_sqrt = beta * sqrt(3)/3;


for i = 0:n-1
    alpha = a + i*h + h/2;
    result = result + (f(beta_sqrt + alpha) + f(-beta_sqrt + alpha));
end


result = beta * result;
end

