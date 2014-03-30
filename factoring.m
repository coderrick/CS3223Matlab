function res = factoring(n)
% @ factorize a integer
% @ Params:
% @     n: positive integer n > 0
% @ Return: 
% @     res: factors (each factors > 1)
% @     products of all the factors == n
% @ Usage example:
% @    res = factoring(2); res = [2];
% @    res = factoring(3); res = [3];
% @    res = factoring(12); res = [2 2 3]; 2*2*3 = 12
% @    res = factoring(48); res = [2 2 2 2 3]; 2*2*2*2*3 = 48
% @    res = factoring(49); res = [7 7]; 7*7 = 49
% @ Author: Erkang Cheng
% @ Date: 9/20/2013

res = [];

% if n==1 return empty
% otherwise
while n > 1
    p = smallest_divisor(n);
    res = [res p]; 
    n = floor(n/p); 
end

end