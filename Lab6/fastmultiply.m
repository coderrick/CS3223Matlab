function res = fastmultiply(x, y)
% @ get binary result of multiplication of two input binary integers
% @ Params:
% @     x: binary integer: use array to represent it
% @     y: binary integer: use array to represent it
% @ Return:
% @     res = decimal x*y in binary
% @ Usage example:
% @    res = fastmultiply([1 1], [1 0]) = [1 1 0], which is actrally : 3*2->6
% @ Author: Erkang Cheng
% @ Date: 10/08/2013

% link:http://www.geeksforgeeks.org/divide-and-conquer-set-2-karatsuba-algorithm-for-fast-multiplication/

%%
% find the maximum of lengths of x and y and make length
% make smaller string same as that of larger string by add zeros
nx = length(x);
ny = length(y);

n_max = max(nx, ny);

%% 
if (nx==0 || ny==0)
    res = [0];
    return;
end

%% nx==1 || ny==1 step out from recursive calling
if (nx==1)
    if x(1)==0
        res = [0];
    else
        res = y;
    end
    return;
end
if (ny==1)
    if y(1)==0
        res = [0];
    else
        res = x;
    end
    return;
end

%% make sure nx==ny
% pad zeros before x or y if nx<nmax or ny<nmax
if (nx < n_max)
    tmp = zeros(1, n_max);
    tmp(n_max-nx+1:n_max) = x;
    x = tmp;
end

if (ny < n_max)
    tmp = zeros(1, n_max);
    tmp(n_max-ny+1:n_max) = y;
    y = tmp;
end


%% otherwise nx>=2, ny>=2
mid_x = floor(n_max/2);
mid_y = floor(n_max/2);

%% divide and conquer
xl = x(1:mid_x);
xr = x(mid_x+1:end);

yl = y(1:mid_y);
yr = y(mid_y+1:end);

% recursive calling
P1 = fastmultiply(xl, yl); % P1 is in binary
P2 = fastmultiply(xr, yr); % P2 is in binary

xl_xr = sumtwobin(xl, xr);
yl_yr = sumtwobin(yl, yr);

P3 = fastmultiply(xl_xr, yl_yr);

%% calculate P312 = P3-P1-P2 = P3 - (P1+P2)
P12 =  sumtwobin(P1, P2);
P312 = substracttwobin(P3, P12);

% res = P1*2^n + P312*2^(n/2) + P2


%% 
frist_half_size  = floor(n_max/2);   % first half of string, floor(n/2)
second_half_size = (n_max-frist_half_size);

%% P1_shift = P1*2^n : shift n bits to left == pad n 0 in the end of P1
len_P1 = length(P1);
P1_shift = zeros(1, len_P1+2*second_half_size);
P1_shift(1:len_P1) = P1;

% P312_shift = P312*2^(n/2) shift n/2 bits == pad n/2 0 in the end of P312
len_P312 = length(P312);
P312_shift = zeros(1, len_P312+second_half_size);
P312_shift(1:len_P312) = P312;

%% res = P1*2^n + P312*2^(n/2) + P2
res_tmp = sumtwobin(P1_shift, P312_shift);
res = sumtwobin(res_tmp, P2);


% if all zeros, return 0;
if (sum(res) == 0)
    res = [0]; 
	return
end


%% remove 0s in the front
len_res = length(res);
idx = 0;
for i=1:len_res
    if (res(i)~=0)
        break;
    else
        idx = i;
    end
end
if (idx>=1)
    res(1:idx) = [];
end

