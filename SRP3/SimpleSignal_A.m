function SimpleSignal_A()

sig = [1 1 1 1  1 1 1 1  0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 0  1 1 1 1  1 1 1 1];

[re, im] = MyDFT(sig);


t = 1:length(sig);
subplot(3,1,1);
stem(t,sig);
title('Original (MyDFT)');
xlabel('Sample');
ylabel('Sample value');
grid on; hold on;

subplot(3,1,2);
stem(t, re);
title('Real (MyDFT)');
xlabel('Sample');
ylabel('Sample value');
grid on;

subplot(3,1,3);
stem(t, im);
title('Imag (MyDFT)');
xlabel('Sample');
ylabel('Sample value');
grid on;


end