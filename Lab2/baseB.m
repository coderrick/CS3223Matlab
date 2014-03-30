%baseB(x,y)
%Computes a number in one base to another.
function res = baseB(x,y)
res = [];

if not(isa(x,'numeric'))
    res = [];
    return
elseif x < 0 | ceil(x) > x
    res = [];
    return
end

list = [];
while x > 0
    %x=2*floor(x/2)+ mod(x,2)
    % So to implement baseB x=b*floor(x/y)+mod(x,y)
    bit = mod(x, y);
    list = [list bit];
    x = floor(x/y);
end
res = list;
end
    