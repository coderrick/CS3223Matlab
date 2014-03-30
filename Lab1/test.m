%type test after >> to use
%Uses slow_gcd to computer the GCD of 20 random integers given for a and b.
%The time it takes to execute the function is also documented.

%generate A and B size is 1x20
A = randi([1000,100000],1,20);
B = randi([1000,100000],1,20);

res = zeros(20,4);
%loop 20times
for i = 1:20
    a = A(i);
    b = B(i);
    %call function
    tic
    sgcd = slow_gcd(a,b);
    wt = toc;
    %output
    res(i, 1) = a;
    res(i, 2) = b;
    res(i, 3) = sgcd;
    res(i, 4) = wt;
    fprintf('a=%d, b=%d, gcd=%d, wt=%f\n', a, b, sgcd, wt);
end

res