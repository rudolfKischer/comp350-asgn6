

function [result] = statError(x)
%STATERROR 
%   this is the fn, for the error funciont
% 2/PI * (integral from 0 to t) of e^(-x^2) dt
% we want the non integral part, the integral part is handled seperately

persistent constant
if isempty(constant)
    constant = 2/sqrt(pi);
end

result = constant * exp(-x^2);

end

