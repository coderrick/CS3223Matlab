function res = smallest_divisor(n)
% @ calculate smallest divisor of given integer n
% @ Params:
% @     n: positive integer n > 0
% @ Return: 
% @     res: smallest divisor of n
% @ Usage example:
% @    for all the even integers, return 2
% @     res = smallest_divisor(2); res = 2
%      others:
% @     res = smallest_divisor(5); res = 5
% @ Author: Erkang Cheng
% @ Date: 9/20/2013

% if n==1 return 1
if n==1 
    res = 1; 
    return; 
end

% if n is even, return 2
if mod(n,2)==0
    res = 2; 
    return; 
end

% otherwise, seek odd number from 3 to sqrt(n)
for k=3:2:floor(sqrt(n))
    if mod(n,k)==0
        res = k; return
    end
end

% not find a divisor, n is prime number
% return n
res = n;

end