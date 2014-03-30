%Input:2 matrices matmul(MA,BM)
%Output: the product of 2 2x2 matrices
function res = matmul(MA, BM)
A = MA(1,1);%getting elements from matrix
B = MA(1,2);
C = MA(2,1);
D = MA(2,2);

E = BM(1,1);
F = BM(1,2);
G = BM(2,1);
H = BM(2,2);

P1 = A*(F-H);
P2 = (A+B)*H;
P3 = (C+D)*E;
P4 = D*(G-E);
P5 = (A+D)*(E+H);
P6 = (B-D)*(G+H);
P7 = (A-C)*(E+F);

res(1,1) = P5+P4-P2+P6;
res(1,2) = P1+P2;
res(2,1) = P3+P4;
res(2,2) = P1+P5-P3-P7;

end

