function SimpleSignal_B()
sig = [1 1 1 1  1 1 1 1  0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 0  1 1 1 1  1 1 1 1];

M = length(sig);
s = fft(sig);
re = real(s)/M;
im = imag(s)/M;

t = 1:M;

subplot(3,1,1);
stem(t,sig);
title('Original');
xlabel('Sample');
ylabel('Sample value');
grid on; hold on;

subplot(3,1,2);
stem(t, re);
title('Real');
xlabel('Sample');
ylabel('Sample value');
grid on;

subplot(3,1,3);
stem(t, im);
title('Imag');
xlabel('Sample');
ylabel('Sample value');
grid on;


end