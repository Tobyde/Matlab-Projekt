%Filtern eines Störsignals aus einem Audiosignal
clear;

%Einlesen der Audiodatei
[audio, fs] = audioread('Aufgabe2.wav');

%FFT
L=length(audio);
f=2*fs*linspace(-0.5,0.5,L);
Y=fftshift(fft(audio)/L,2);
%plot(f,20*log10(abs(Y)))


%Real- und Imaginärteil trennen
Yreal = real(Y);
Yimag = imag(Y);
figure(1), plot(f,abs(Yreal(:,1)))
figure(2), plot(f,Yimag)

%Filter Real
%Yreal(find(Yreal(:,1)> (5.5*10^-4)))=0;
%figure(3), plot(f,abs(Yreal(:,1)))
[pks,locs,w] = findpeaks(abs(Yreal(:,1)),'MinPeakHeight',0.0005);
%Yreal(find(Yreal(locs,1)> (5.5*10^-4)))=0;
w=round(w);
Yreal(locs,1)=0;
figure(4)
plot(f,(Yreal(:,1)))



%'Threshold', 0.0001



%Y(find(abs(Y(:,:))>(6*10^-4)))=0;
%figure(2)
plot(f,abs(Y))

y=ifft(Y);

%soundsc(y,fs)