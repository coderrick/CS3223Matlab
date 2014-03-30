%Input: Two strings 
%Output: String that is longest substring of both inputs
function res =  lc_substr(string1, string2)
m = length(string1);
n = length(string2);
L = zeros(m,n);
    %L = array(1..m, 1..n);%L = [m x n] 
    %string_list1 = 
    z = 0;
    ret = [];
    for i=1:m
        for j=1:n
            if (string1(i) == string2(j))
                if (i == 1 || j == 1)
                    L(i,j) = 1;
                else
                    L(i,j) = L(i-1,j-1) + 1;
                end
                if L(i,j) > z
                    z = L(i,j);
                    ret = string1(i-z+1:i);
                elseif (L(i,j) == z)
                    ret = [ret, string1(i-z+1:i)];
                end
            else
                L(i,j) = 0;
            end
         end
     end
    res = ret;