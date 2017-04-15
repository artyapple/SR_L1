function U3(k)

filename = 'C:\Users\AI\Documents\Studium\SS2017\SR\GitRiff02.wav';
[yRead,Fs]=audioread(filename);
fileSize = size(yRead,1);
origY = yRead(:,1);

y = zeros(fileSize,1);

disp('y ready');
disp('play 1');
%sound(origY, Fs);

%pause(10);

gdh = GuitarDistortion (origY, 1, 50);
gdh_norm = gdh/max(abs(gdh));
%sound(gdh_norm, Fs);
audiowrite('gdh.wav',gdh_norm, Fs);
%pause(10);

gdb = GuitarDistortion (origY, 2, 50);
gdb_norm = gdb/max(abs(gdb));
%sound(gdb_norm, Fs);
audiowrite('gdb.wav',gdb_norm, Fs);
%pause(10);

gd = GuitarDelay (origY, 6000, 0.35);
gd_norm = gd/max(abs(gd));
%sound(gd_norm, Fs);
audiowrite('gd.wav',gd_norm, Fs);

xStart = -1;
xStop = 1;
x = linspace(xStart,xStop,fileSize);

figure(2);
subplot(2,1,1);
plot(x,gdh);
grid on; hold on;

subplot(2,1,2);
plot(x,gdb);
grid on;

end