%Input: sorted array A
%Output: index i for which A[i] = i
function res = div_con_search(A)
n = length(A);
low = 1;
high = n;

while (low <= high)
    mid = floor((low+high)/2);
    if (A(mid) == mid)%A[mid]
        res = mid; 
        return;
    end
    if (A(mid)<mid)
        low = mid + 1; 
    else
        high = mid-1;
    end

end

res=-1;
