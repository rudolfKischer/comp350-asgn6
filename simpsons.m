function [numI, eval_num, err] = simpsons(f, a, b, delta, level, level_max, eval_num, cache)
  % SIMPSONS Adaptive Simpson's rule with caching
  
  if nargin < 8
      cache = containers.Map({'key'}, {0});
      remove(cache, 'key');
  end
  
  h = b - a;
  c = (a + b) / 2;
  points = [a, c, b];
  
  for point = points
      point_str = num2str(point);
      if ~isKey(cache, point_str)
          cache(point_str) = f(point);
          eval_num = eval_num + 1;
      end
  end
  
  I_1 = h * (cache(num2str(a)) + 4 * cache(num2str(c)) + cache(num2str(b))) / 6;
  level = level + 1;
  d = (a + c) / 2;
  e = (c + b) / 2;
  new_points = [d, e];
  
  for point = new_points
      point_str = num2str(point);
      if ~isKey(cache, point_str)
          cache(point_str) = f(point);
          eval_num = eval_num + 1;
      end
  end
  
  I_2 = h * (cache(num2str(a)) + 4 * cache(num2str(d)) + 2 * cache(num2str(c)) + 4 * cache(num2str(e)) + cache(num2str(b))) / 12;
  
  err = abs(I_2 - I_1) / 15;
  
  if level >= level_max || err <= 15 * delta
      numI = I_2 + (I_2 - I_1) / 15;
  else
      [numI_1, new_eval_num_1, err_1] = simpsons(f, a, c, delta / 2, level, level_max, eval_num, cache);
      [numI_2, new_eval_num_2, err_2] = simpsons(f, c, b, delta / 2, level, level_max, new_eval_num_1, cache);
      numI = numI_1 + numI_2;
      eval_num = new_eval_num_2;
      err = max(err_1, err_2); % Take the maximum of the errors
  end
  
  end

% function [numI, eval_num, err] = simpsons(f, a, b, delta, level, level_max, eval_num)
% %SIMPOSONS % adaptive simpsons rule
% %  


% h = b - a;
% c = (a + b) / 2;
% I_1 = h * (f(a) + 4 * f(c) + f(b)) / 6;
% level = level + 1;
% d = (a + c) / 2;
% e = (c + b) / 2;
% I_2 = h * (f(a) + 4 * f(d) + 2 * f(c) + 4 * f(e) + f(b)) / 12;

% % count the number of function evaluations
% eval_num = eval_num + 3 + 5;

% err = abs(I_2 - I_1) / 15;

% if level >= level_max
%     numI = I_2;
% else
%     if err <= 15 * delta
%         numI = I_2 + (I_2 - I_1) / 15;
%     else
%         [numI_1, new_eval_num_1, err] = simpsons(f, a, c, delta / 2, level, level_max, eval_num);
%         [numI_2, new_eval_num_2, err] = simpsons(f, c, b, delta / 2, level, level_max, eval_num);
%         numI = numI_1 + numI_2;
%         eval_num = new_eval_num_1 + new_eval_num_2;
%     end
% end



% % fprintf('level: %d, eval_num: %d\n', level, eval_num);
% % fprintf('I_1: %f, I_2: %f, numI: %f\n', I_1, I_2, numI);
% end

