%Input two non negative integers a and b
%Output Integers x,y,d such that d = gcd(a,b) and ax + by = d
function [x,y,d]= extended_euclid(a,b)
if b == 0
    x = 1; y = 0; d = a;
else
    [xx, yy, d] = extended_euclid(b, mod(a, b));
    x = yy; y = xx - floor(a/b)*yy;
end
end