%slow_gcd(v1,v2);
%A rudimentary but inefficient way of computing the Greatest Common Divisor
%of two numbers.
function [sgcd] = slow_gcd(v1, v2)
while v1 ~= v2
   
   if v1 > v2
       v1 = v1-v2;
   else
       v2 = v2-v1;
   end 
end
    sgcd = v1;
end