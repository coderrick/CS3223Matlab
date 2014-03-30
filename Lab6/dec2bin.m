function res = dec2bin(x)
    if x == 1
    res = [0 0 0 1];
    return;
    else
        res = [1 0 1 0];
        reshape(res,2);
        %{
        z_xl * pwr2bin(n/2)^z_n2;
        z_n2 = fastmultiply(z_xl, z_n2);
        %}
        return
    end
end
%{
x = xl * 10^n/2 + xr;
z_xl = dec2bin(xl);
z_xr = dec2bin(xr);
res = z_xl * 10^n/2 + z_xr;
z_xl * pwr2bin(n/2);
%}

%function dec2bin(x)
%if n = 1: return binary[x]
%else:
%split x into two decimal numbers xL, xR with n=2 digits each
%return ???


