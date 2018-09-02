% Aufgabe 2
% Filtern eines St�rsignals aus einem Audiosignal
clear;

%Einlesen der Audiodatei
[audio, fs] = audioread('Aufgabe21.wav');

%Darstellung im Zeitbereich
length = size(audio,1);
time = 0:1/fs:(length-1)/fs;
figure(1);
plot(time,audio);
title('Zeitsignal mit St�rsignalen');
xlabel('t in s');
ylabel('s(t)');

%FFT
figure(2)
Y = fft(audio,length)/length;
f = linspace(-fs/2,fs/2,size(Y,1));
Y = fftshift(Y);
semilogy(f,abs(Y));
title('Frequenzspektrum mit St�rsignalen');
xlabel('f in Hz');
ylabel('|Y(f)| in dB');



%Anzeige der St�rfrequenzen
[~,locs,~,~] = findpeaks(abs(Y(:,1)),f,'Threshold',1e-3);
round(locs)

%Real- und Imagin�rteil trennen
Yr = real(Y);
Yi = imag(Y);

%Filterung der St�rfrequenzen
[~,locs,~,~] = findpeaks(abs(Y(:,1)),'Threshold',1e-3);
 for x = 1:size(locs)
     Yr(locs(x)-200:locs(x)+200,:)=0;
     Yi(locs(x)-200:locs(x)+200,:)=0;
 end

%Anzeige des Frequenzspektrums ohne St�rfrequenzen
figure(3)
Y = complex(Yr,Yi);
semilogy(f,abs(Y));
title('Frequenzspektrum ohne St�rsignalen');
xlabel('f in Hz');
ylabel('|Y(f)| in dB');

%IFFT
Y = fftshift(Y);
y=ifft(Y)*length;
figure(4);
plot(time,y);
title('Zeitsignal ohne St�rsignalen');
xlabel('t in s');
ylabel('s(t)');

%Ausgabe auf Soundkarte
soundsc(y,fs)
