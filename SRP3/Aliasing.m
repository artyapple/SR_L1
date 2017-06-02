function sig = Aliasing(fS)

FIRST = 1;
TS = 1/fS;

FreqVek = [500 1000 1500 2000 2500 3000 3500 4000 4500];

t = 0:TS:0.5;

[s_m,s_n] = size(FreqVek);
len =s_n; 

sig = cos(2*pi*FreqVek(FIRST)*t);
for i=FIRST+1:1:len
    sig = [sig cos(2*pi*FreqVek(i)*(t+0.5))];
end

return