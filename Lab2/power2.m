%power2(x,y), x must be x = [1 1;1 0]
%Computes the powers of integers as well as matrices.
function res = power2(x,y)
b = base2(y);
n=length(b);
p2 = x;
num =1;
for k = 1:n %change was made here
    if b(k) == 1;
        num = num*p2;
    end
    p2 = p2^2;
end
res = num;
end