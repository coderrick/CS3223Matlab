function res = substracttwobin(x, y)
% @ sum two binary integers
% @ Params:
% @     two integers: in binary representation: x >= y
% @ Return: 
% @     res = x-y: res also in binary representation
% @ Usage example:
% @    res = substracttwobin([1 1 0 1], [1 1]) = [1 0 1 0], which is actrally : 13 - 3 = 10
% @ Author: Erkang Cheng
% @ Date: 10/03/2013

%%

% substraction = true code + complemenatal code = true code + ones'
% complemenatal code + 1
%%
n_x = length(x);
n_y = length(y);

if (n_x < n_y) 
    disp('error');
    return;
end

%%
n_max = max(n_x, n_y);

%% pad 0 before y if n_y<n_x
yy = zeros(1, n_max);
if (n_x ~= n_y)
    yy(n_max-n_y+1:n_max) = y;
else
    yy = y;
end


%% get complement representation of y
y_com = zeros(1, n_max);

for i=1:n_max
    if (yy(i)==0)
        y_com(i) = 1;
    else
        y_com(i) = 0;
    end
end

%% get ones' complement representation of y
y_com_add1 = sumtwobin(y_com, [1]);

res = sumtwobin(x, y_com_add1);

%% only keep same size of n_max
n_res = length(res);
if (n_res > n_max)
    res = res(2:end);
end

%% check result if is all zeros
if (sum(res)==0)
    res = [0];
    return;
end

%% remove 0s in the front
idx = 0;
for i=1:n_max
    if (res(i)~=0)
        break;
    else
        idx = i;
    end
end
if (idx>=1)
    res(1:idx) = [];
end

end

