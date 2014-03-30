function res = d_fft(x)
%fft computes fast fourier transform of n = 2^k numbers x
n = length(x);
if n==1
    res = x;
    return;
end

x_even = x(1:2:end);%A(x)=1-2x+2x^2-x^3
x_odd = x(2:2:end);
u = d_fft(x_even);
v = d_fft(x_odd);
a = 2*pi*(0:n/2-1)/n;
rts = exp(li.*a);
for j = 1:n/2
    w(j) = u(j)+rts*v(j);
    w(j + n/2) = u(j)-rts*v(j);
end
res = w;
end