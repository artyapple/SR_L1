function g = MY_IIR_FILTER(s1,IIR_1400_40dB)
b0 =IIR_1400_40dB(1,1);
b1 =IIR_1400_40dB(1,2);
b2 =IIR_1400_40dB(1,3);
a1 =IIR_1400_40dB(1,5);
a2 =IIR_1400_40dB(1,6);

g = zeros(max(size(s1)),1);
g(1) = b0 * s1(1);
g(2) = -a1 * g(1) + b0 * s1(2) + b1 * s1(1);
for k=3:1:max(size(s1))
    g(k) = -a1 * g(k-1) - a2 * g(k-2) + b0 * s1(k) + b1 * s1(k-1) + b2 * s1(k-2);
end
return;