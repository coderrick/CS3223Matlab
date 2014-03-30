function res = merge_iterative(x, y)
% @ merge two sorted array x and y
% @ Params:
% @     sorted array x and y
% @ Return:
% @     merge x and y, also sorted
% @ Usage example:
% @    res = merge_sort([2 3 5 10], [1 6 7 13]), res = [1 2 3 5 6 7 10 13]

%%
len_x = length(x);
len_y = length(y);

if len_x==0 res = y; return; end
if len_y==0 res = x; return; end

idx_x = 1;
idx_y = 1;

res = [];
while(idx_x<=len_x && idx_y<=len_y)
    if (x(idx_x) <= y(idx_y))
        res = [res x(idx_x)];
        idx_x = idx_x + 1;
    else
        res = [res y(idx_y)];
        idx_y = idx_y + 1;
    end
end

% put all remian elements into res
while idx_x <=len_x
    res = [res x(idx_x)];
    idx_x = idx_x + 1;
end

while idx_y <=len_y
    res = [res y(idx_y)];
    idx_y = idx_y + 1;
end

end