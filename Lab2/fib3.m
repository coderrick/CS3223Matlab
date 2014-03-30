% fib3(y)
% Computes the fibonacci number of integers.
function res = fib3(n)
x=[1 1; 1 0];
p = power2(x,n);
% n = length(p);
% f = x;
% for k = 1:n 
%     if b(k) == 1;
%         num = 1*f;
%     end
%     f = f:x;
% end
res = p(1,2);
end