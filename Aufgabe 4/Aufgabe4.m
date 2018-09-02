clear;

%Einlesen des Bildes
swBild=imread('Aufgabe4.png');

%Erstellen des Generatorpolynoms und des Initialwerts
genPol = [12 10 4 0];
initWert = [1 0 0 1 1 0 1 1 0 0 1 0];

%Anzahl der Binärstellen des Bilds auslesen
binStellen = size(swBild,1)*size(swBild,2);

%Matrix in einen binären Spaltenvektor
binVect = reshape(swBild.',binStellen,1);

%Erzeugen der PN-Sequenz
pnSequenz = step(comm.PNSequence('Polynomial',genPol, ...
    'SamplesPerFrame', binStellen ,'InitialConditions',initWert));

%Verarbeiten der Daten
decodDaten = xor(pnSequenz , binVect);
decodDaten = reshape(decodDaten,8 ,[]).';
decodDaten = num2str(decodDaten);
decodDaten = char(bin2dec(decodDaten)).';
decodDaten = fliplr(decodDaten)


