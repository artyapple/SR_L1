function aufgabe4()

load('notch_filter_880')

[s1, f_Sample] = audioread('Z:\matlab\SR_L4_Audio\GitRiff_880Hz.wav');
s2 = filter(Num,Den, s1);

s1= s1/max(abs(s1));
s2= s2/max(abs(s2));

plot(s1)
sound(s1,f_Sample);
pause;
sound(s2,f_Sample);
plot(s2);

end