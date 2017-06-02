function CosSignal(F)

M = 256;
t = 0:M-1;
x = cos(2*pi*F*t/M);

% anti-leakage
len = length(x);
win = hann(len);
x = x .* win';

X = fft(x);

X_abs = abs(X);
X_norm = X/max(X_abs);
re = real(X);
im = imag(X);

subplot(4,1,1);
stem(x);
title('X Norm');
xlabel('Sample');
ylabel('Sample value');
grid on; hold on;

subplot(4,1,2);
stem(re);
title('Real');
xlabel('Sample');
ylabel('Sample value');
grid on;

subplot(4,1,3);
stem(im);
title('Imag');
xlabel('Sample');
ylabel('Sample value');
grid on;

subplot(4,1,4);
stem(X_abs);
title('Abs X');
xlabel('Sample');
ylabel('Sample value');
grid on;

end