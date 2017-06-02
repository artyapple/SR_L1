function Aufgabe1()

fS1 = 10000;
fS2 = 6000;

sig1 = Aliasing(fS1);
sig2 = Aliasing(fS2);

figure(2);
subplot(2,1,1);
plot(sig1);
title('Aliasing fs=10000');
xlabel('Sample');
ylabel('Sample value');
grid on; hold on;

subplot(2,1,2);
plot(sig2);
title('Aliasing fs=6000');
xlabel('Sample');
ylabel('Sample value');
grid on;

sound(sig1, fS1);
pause;
sound(sig2, fS2);

end