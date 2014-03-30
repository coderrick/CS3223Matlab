%Input two integers a and b; div_con_gcd(a,b)
%Out is one integer that is the biggest divisor of both the inputs
%Program breaks gcd up into four cases that handles when the inputs a and b
%are:
%Both are even
%a is odd and b is even 
%b is odd and a is even
%Both are odd
function res = div_con_gcd(a,b)
%check to see if input is odd by taking the mod of the input by even #
if (mod(a,2)==0 && mod(b,2)==0)%even:even case
    g = gcd(a/2,b/2);
    res=2*g;
end
if (mod(a,2)~=0 && mod(b,2)==0)%odd:even case
    g = gcd(a,b/2);
    res = g;
end
if (mod(a,2)==0 && mod(b,2)~=0)%even:odd case
    g = gcd(a/2,b);
    res = g; 
end
if (mod(a,2)~=0 && mod(b,2)~=0)%odd:odd case
    g = gcd((a-b)/2,b);
    res = g;
end
return