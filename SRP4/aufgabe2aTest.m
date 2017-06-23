% Bei fStop = 1600Hz soll die Dämpfung mindestens 80dB betragen.

% Probieren Sie verschiedene Window-basierte Entwurfsmethoden (Butterworth, chebychev, Elliptic) aus. 

fs = 44100; % Samplefrequenz festlegen
fg = 1500;% Grenzfrequenz des Filters festlegen
FreqNorm = fg/(fs/2);
Length = 32; % Filterlänge festlegen
wnd = butter(Length); % Fensterfunktion erzeugen
%wnd = hamming(Length); % Fensterfunktion erzeugen
%wnd = chebwin(Length); % Fensterfunktion erzeugen
% Filterkoeffizienten berechnen (b = Koeff.-Vektor)
b = fir1(Length-1, FreqNorm, wnd);
% Impulsantwort anzeigen
stem(b);
% Frequenzantwort anzeigen (dB-Skala)
[H,w]=freqz(b);
plot(w/(2*pi), 20*log10(abs(H)));