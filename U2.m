function U2(k)

t_Start = 0;
t_Stop = 5;
fStart = 10;
fStop = 5000;
Fs = 10000; Ts = 1/Fs;

t = t_Start:Ts:t_Stop;
disp(t)

yRead = chirp(t, fStart, t_Stop, fStop, 'logarithmic');

[m,n] = size(yRead);
y = yRead;
origY = yRead;

disp('y ready');
disp('play 1');
sound(y, Fs);

pause(5);

disp('start filter');
for idx = 1:numel(y)
    if idx>k
        temp = 0;
        for i=idx:-1:idx-k
            temp = temp + y(i);
        end    
        y(idx)=temp/k;
    end
end
disp('filter ready');

y_norm = y/max(abs(y));
disp('norm ready');

disp('play 2');
sound(y_norm,Fs);


figure(2);
subplot(2,1,1);
dt = 1/Fs;
t = 0:dt:(length(y_norm)*dt)-dt;
plot(t, origY);
grid on; hold on;

subplot(2,1,2);
plot(t, y_norm);
grid on;

audiowrite('ungefilterte_Datei.wav',origY, Fs);
pause;
audiowrite('Mittelwert_gefilterte_Datei.wav',y_norm, Fs);

disp('END');
end