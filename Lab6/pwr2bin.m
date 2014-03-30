%Input: a power for 10^n
%Output: A binary representation for 10^n
function res = pwr2bin(n)
if n == 1
   res = [1 0 1 0];
    return ;
end
if (mod(n, 2)==0)           %for even case
    z = pwr2bin(n/2);
    res = fastmultiply(z,z);
else                        %for odd case 
    z = pwr2bin(floor(n/2));%individual pieces of integer divisin w/o remainder
    remainder = pwr2bin(mod(n, 2));% remainder
    res = fastmultiply(fastmultiply(z,z), remainder);
end
    
end

    
    