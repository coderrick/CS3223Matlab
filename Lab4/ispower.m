function res = ispower(n)
% @ check given integer n is power(base^k) or not,
% @ Params:
% @     n: positive integer n > 0
% @ Return:
% @     if yes (n==base^k) list all the results
% @ Usage example:
% @    is_power(4); 4=2^2;
% @    res = is_power(12); res = -1;
% @
% @ Author: Erkang Cheng
% @ Date: 9/25/2013

%%
% the codes are comments by ex n=144 = 12^2
% step 1: factorize the given integer
factors = factoring(n);

len_factors = length(factors);

% count number of each factor
% n = 144
% factors = factoring(144) = [2 2 2 2 3 3]
% we want to count the number of each factor
% factor_val = [2 3]; we have two different factors
% factor_num = [4 2];
% for factor_val(1), factor=2, the number is 4,
% for factor_val(2), factor=3. the number is 2
factor_val = [];
factor_num = [];
while (len_factors > 0)
    
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

power = 2:floor(log2(n));
a = [0 0];
b_all = a * length(power);  % base for k=2,3,...log2(n)
b_all(len) = -1;

i_k = 1;
for k=2:floor(log2(n))
    b = 1;  % init base to 1
    
    for i=1:len
        % if current factor is even, calculate base
        % ex. n=144,
        % 144 = 2*2*2*2*3*3  = (2^2)^2 * (3^1)^2 = 12^2
        % factor_val = [2 3], factor_num = [4 2];
        % i = 1:
        %    exponent = factor_num(1)/k: expoent = 4/2 = 2;
        %    b = b * (factor_val(1).^exponent ): b = b*2^expoent = 1*2^2 = 4;
        % i = 2:
        %    exponent = factor_num(2)/k: expoent = 2/2 = 1;
        %    b = b * (factor_val(2).^exponent ): b = b*3^expoent = 4*3^1 = 12;
        
        if (mod(factor_num(i),k) == 0)
            exponent = factor_num(i)/k;
            b = b * (factor_val(i).^exponent );
        else
            % otherwise, not a power
            b = -1;
            disp('Not a power for this base');
            break;           
        end   
    end
    b_all(i_k)=  b;
    i_k = i_k + 1;
end

%% display all the results
res = -1;
for i=1:length(power)
    if (b_all(i)==-1) continue; end
    
    str = ['n = ',num2str(b_all(i)),'^', num2str(power(i))];
    disp(str);
    
    res = 1;
end

end