%Input 2 or more sorted arrays
%Output one sorted array
%uses merge iterative arrays; branches out in a tree to calculate multiple
%inputs.
function res = slow_k_merge(varargin)%varargin allows multiple inputs
res = [];
k = nargin;
if k<=2
    disp('Must enter more than one array');
   
else
    for i=1:k
    res = merge_iterative(res,varargin{i});
    
    end
end
