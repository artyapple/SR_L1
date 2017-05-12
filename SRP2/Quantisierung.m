function Quantisierung(Qsteps)

filename1 = 'Z:\matlab\SR_L2_Audio\GitRiff.wav';
[s_Read,Fs]=audioread(filename1);
[s_m,s_n] = size(s_Read);
s = s_Read(:,1);

s_norm = s/max(abs(s));

q = round(s*Qsteps);

q_norm = q/max(abs(q));

sound(q_norm, Fs);
pause;

figure(2);
subplot(2,2,1);
t = 15000:15400;
s_plot = s_norm(15000:15400);
plot(t, s_plot, 'b');
grid on; hold on;

subplot(2,2,2);
q_plot = q_norm(15000:15400);
plot(t, q_plot, 'r');
grid on;

q_err = s_plot - q_plot;

subplot(2,2,3);
plot(t, q_err, 'k');
grid on;

disp('max. Quantisierungfehler:')
disp(max(abs(s_norm - q_norm)));

end