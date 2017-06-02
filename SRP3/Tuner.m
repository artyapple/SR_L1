function Tuner()
FIRST = 1;
filename = 'Z:\matlab\SR_L3_Audio\GitOneString.wav';
[read,Fs]=audioread(filename);

s = size(read,1);
T = s/Fs;

deltaF = 1/T;

fVek = zeros(1,s);
tmp = 0;
for i=FIRST:1:s
    fVek(i)=tmp;
    tmp = tmp + deltaF;
end

sound(read,Fs);
readfft = fft(read);

figure(2);
subplot(2,1,1);
plot(1:s, read);
title('Original');
xlabel('Sample');
ylabel('Sample value');
grid on; hold on;

subplot(2,1,2);
stem(fVek, abs(readfft));
title('Abs of FFT');
xlabel('f Vek');
ylabel('Sample value');
grid on;

end
