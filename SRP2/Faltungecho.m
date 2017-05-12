function Faltungecho()

Echos = [ 0 1.0;
          0.3 0.3;
          0.5 0.2;
          0.7 0.1;
          0.75 0.1];

filename1 = 'Z:\matlab\SR_L2_Audio\GitRiff.wav';
[s_Read,Fs]=audioread(filename1);
[s_m,s_n] = size(s_Read);
s = s_Read(:,1);

echo_len = size(Echos);
last_echo_item = Echos(echo_len);
last_echo_value = last_echo_item(1);

h = zeros(round(Fs *  last_echo_value) + 1,1);

for idx = 1:1:size(Echos)
    pos = round(Echos(idx, 1) * Fs) + 1;
    h(pos) = Echos(idx, 2);
end

g = conv(s, h);

g_norm = g/max(abs(g));

sound(s_Read, Fs);
pause;
sound(g_norm, Fs);
%pause;

end