%Input 2 or more sorted arrays
%Output 1 sorted array
%This function uses merge_iterative to call itself recursively on separate
%tasks.
function res = k_fastmerge(varargin)

k=nargin;
if k == 0
    res = [];
    disp('Insert the arrays to be merged');
    return
end
if(k == 1)
    res = varargin{1};
    return
end
    res = merge_iterative(k_fastmerge( varargin{1:floor(k/2)}),k_fastmerge(varargin{floor(k/2) + 1:end}) );
end
