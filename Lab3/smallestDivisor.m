%Input: Positive integer N
%Output: The smallest integer that divides N
function res = smallestDivisor(N)
if mod(N,2)==0
    res = 2;
    return;
end
for i=3:N+2
    if i < sqrt(N+2)
        res = sqrt(N);
        return
    else
        res = N;
    end
end
return
end
