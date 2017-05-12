function Faltungshall()

filename1 = 'Z:\matlab\SR_L2_Audio\GitRiff.wav';
filename2 = 'Z:\matlab\SR_L2_Audio\TrigRoom2.wav';
[s_Read,Fs]=audioread(filename1);
[s_m,s_n] = size(s_Read);
s = s_Read(:,1);

[h_Read,Fs]=audioread(filename2);
[h_m,h_n] = size(h_Read);
h = h_Read(:,1);

len = s_m + h_m - 1;
% self func
g1 = zeros(len,1);
% matlab conv
g2 = zeros(len,1);

g1 = MyConv(s,h);
g2 = conv(s, h);

g1_norm = g1/max(abs(g1));
g2_norm = g2/max(abs(g2));


sound(s_Read, Fs);
pause;
sound(g1_norm, Fs);
pause;
sound(g2_norm, Fs);
%pause;

end