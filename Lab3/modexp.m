%Input: Two n-but integers x and N, an integer exponent y
%Output: x^y mod N0
function res = modexp(x,y,N)
if y == 0
    res = 1;  
    return; 
end
z = modexp(x,floor(y/2),N);
if 0 == mod(y,2)
    res = mod(z^2,N);
    return;
    %return mod(z^2,N);
else
    res = mod(x*z^2,N);
   return;
end
