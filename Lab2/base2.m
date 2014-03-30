% y = base2(x)
%  Returns the binary representation of the positive integer x

function res = base2(x)

res = []; 

if not(isa(x, 'numeric'))
    res = [];
    return
elseif x < 0 | ceil(x) > x
    res = [];
    return
end

lst = [];
while x > 0
    % x = 2*floor(x/2) + mod(x, 2)
    bit = mod(x, 2);
    lst = [lst bit];
    x = floor(x/2);
end
res = lst;
end
   