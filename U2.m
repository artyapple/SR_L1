function U1(k)

t_Start = 0;
t_Stop = 5;
fStart = 10;
fStop = 5000;
Fs = 10000; Ts = 1/Fs;

t = t_Start:Ts:t_Stop;

yRead = chirp(t, fStart, t_Stop, fStop, 'linear');


y = yRead';
origY = y;

disp('y ready');
disp('play 1');
sound(y, Fs);

pause(5);

disp('start filter');
empty = zeros(k-1,1);
ext_y = cat(1,empty,y);
ext_y = cat(1,ext_y,empty);
for idx = size(y,1):-1:k+1
    
        temp = 0;
        for i=idx:-1:idx-k
            temp = temp + ext_y(i);
        end    
        y(idx-k)=temp/k;

end
disp('filter ready');

y_norm = y/max(abs(y));

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