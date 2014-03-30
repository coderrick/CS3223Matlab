function res = merge_sort(a)
len = length(a);
if len==1
    res = a; return;
end

if (len>1)
    p = floor(len/2);
    res = merge_iterative(merge_sort(a(1:p)), merge_sort(a(p+1:end)));
end

end