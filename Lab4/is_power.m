function res = is_power(n)
factors = factoring(n);

len_factors = length(factors);

factor_val = [];%actual number
factor_num = [];%number of factored numbers
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

len = length(factor_num);

power = 2:floor(log2(n));
a = [0 0];%to multiply length by a zero vector
b_all = a * length(power);  % base for k=2,3,...log2(n)
b_all(len) = -1;

i_k = 1;
for k=2:floor(log2(n))
    b = 1;  % init base to 1
    
    for i=1:len
        
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