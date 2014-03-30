function res = sumtwobin(x, y)
% @ sum two binary integers
% @ Params:
% @     two integers: in binary representation
% @ Return: 
% @     res = x+y: res also in binary representation
% @ Usage example:
% @    res = sumtwobin([1 1 0 1], [1 1]) = [1 0 0 0 0], which is actrally : 13+3 = 16
% @ Author: Erkang Cheng
% @ Date: 10/03/2013


%%
n_x = length(x);
n_y = length(y);

n_max = max(n_x, n_y);

% res at least size of n_max, 
% but could be n_max+1, we handle this by carry
res = zeros(1, n_max); 

carry = 0; % init carry to 0

% add from right to left
for i=1:n_max
    
    a_i = 0; % init to 0
    b_i = 0; % init to 0
    
    idx_x   = n_x - i + 1;
    idx_y   = n_y - i + 1;
    idx_res = n_max - i + 1;
    
    if idx_x>0
        a_i = x(idx_x);
    end
    
    if idx_y>0
        b_i = y(idx_y);
    end
    
    val = a_i + b_i + carry;
    
    res(idx_res) = mod(val, 2); % val % 2;
    carry = floor(val/2); % val / 2;
end

% check carry==1 or not
if carry==1
    res(2:n_max+1) = res;
    res(1) = 1;
end

end


