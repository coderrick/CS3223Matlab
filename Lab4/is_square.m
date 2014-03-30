function res = is_square(n)
% @ check given integer n is square(base^2) or not, 
% @ Params:
% @     n: positive integer n > 0

factors = factoring(n);

len_factors = length(factors);

% count number of each factor
factor_val = [];
factor_num = [];
while (len_factors>0)
    
    % current factor
    factor_cur = factors(1);
    
    % find how many factors == current factor
    idx_fac = find(factors==factor_cur);
    num_fac = length(idx_fac);
    
    % set factor_val and its corresponding factor_num
    factor_val = [factor_val factor_cur];
    factor_num = [factor_num num_fac];
    
    % remove current factor from factors
    % go to next factor and repeat above steps
    factors(idx_fac) = [];
    len_factors = length(factors);
end


% check is square or not
% check factor_num is even or not
% all the factor_num are even, then is square, 
% otherwise, not a square

len = length(factor_num);

k = 2; % check square,k=2:log2(n)

b = 1;  % init base to 1

for i=1:len
    
    if (mod(factor_num(i),k) == 0)%check for q^k
        exponent = factor_num(i)/k;%
        b = b * (factor_val(i).^exponent );%
    else
        % otherwise, not a square
        res = -1;
        return;
    end
end

res =  b;

end