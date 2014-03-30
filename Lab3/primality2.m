%Input:positive integer N
%Output:yes/no = 1/0
function res = primality2(N,k)
A = randi(k,N-1,1);

for i = 1:k
    if(modexp(A(i),N-1,N)==1)
    else
        res=0;
        return;
    end
end
res = 1;
return;

