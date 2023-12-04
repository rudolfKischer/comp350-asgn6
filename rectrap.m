function [S_T, error, evals] = rectrap(f, a, b, n, er)
  % RECTRAP Recursive trapezoid function with caching
  
  h_T = b - a;
  S_T = 0.5 * h_T * (f(b) - f(a));
  

  cache = containers.Map({'key'}, {0});
  remove(cache, 'key');
  cache(num2str(a)) = f(a);
  cache(num2str(b)) = f(b);
  evaluations = 2;
  
  for i = 1:n
      h_i = h_T / 2;
      X = a + h_i : h_T : b - h_i;
  

      for j = 1:length(X)
          x_str = num2str(X(j));
          if ~isKey(cache, x_str)
              cache(x_str) = f(X(j));
              evaluations = evaluations + 1;
          end
          X(j) = cache(x_str);
      end
  
      S_i = 0.5 * S_T + h_i * sum(X);
      error = (S_i - S_T) / S_i;
      S_T = S_i;
      h_T = h_i;
      fprintf('S_%d = %f, error = %f\n', i, S_T, error);
      if abs(error) < er
          break
      end
  end
  
  evals = evaluations;
  
  end

% function [S_T, error, evals] = rectrap(f, a, b, n, er)
%  %RECTRAP Recursive trapezoid function
% %   


% h_T = b - a;
% S_T = 0.5 * h_T * (f(b) - f(a)) ;



% evaluations = 2;

% for i = 1:n
%     h_i = h_T / 2 ;
%     X = a + h_i : h_T : b - h_i;
%     X = arrayfun(f, X);
%     evaluations = evaluations + length(X);
%     S_i = 0.5 * S_T + h_i * sum(X);
%     error = (S_i - S_T) / S_i;
%     S_T = S_i;
%     h_T = h_i;
%     fprintf('S_%d = %f, error = %f\n', i, S_T, error);
%     if abs(error) < er
%         break
%     end
% end

% evals = evaluations;

% end

