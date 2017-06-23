function aufgabe2(select)

f_Sample = 44100;
if select == 1
    %Einlesen der Samples
    [s1, f_Sample] = audioread('Z:\matlab\SR_L4_Audio\ACDClike.wav');
elseif select == 2
    %chirp-Signal (44.1kHz Samplerate, 0…5s, 50 …5000 Hz) 
    t = 0 : 1/f_Sample :5; 
    s1 = chirp(t,50,5,5000);
elseif select == 3
    %5s Rauschen (Befehl „rand(…)“ mit 44.1 kHz)
    t = 0 : 1/f_Sample :5;
    s1 = rand(size(t));
elseif select == 4
    %Rechteckimpulsfolge    
    t = 0 : 1/f_Sample :1;                  % 44,1kHz sample freq für 1s        
    d= 0 : 1/20 : 1;                        % 20 Hz Wiederholrate für 1s         
    s1 = pulstran(t,d, 'rectpuls', 0.005);  % Rect der Breite 5ms
end
        
% Anwenden des SOS_IRR Filters
load('IIR_1500_80dB.mat');
s2 = sosfilt(IIR_1500_80dB,s1);
s1= s1/max(abs(s1));
s2= s2/max(abs(s2));
plot(s2);

sound(s1,f_Sample);
pause;
sound(s2,f_Sample);

end