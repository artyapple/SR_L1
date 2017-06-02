function [A,B] = MyDFT(sig)
FIRST = 1;
M = length(sig);

A = zeros(1, M);
B = zeros(1, M);


for i=FIRST:1:M
    sumRe = 0;
    sumIm = 0;
    for j=FIRST:1:M
        angle = 2 * pi * (i-1)/M * (j-1);
        sumRe = sumRe + (sig(j) * cos(angle));
        sumIm = sumIm - (sig(j) * sin(angle)); 
    end
    
    A(i) = sumRe/M;
    B(i) = sumIm/M;
    
end


return