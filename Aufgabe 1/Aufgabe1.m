%Aufgabe 1
%Bildverarbeitung 
clear;

%Bild einlesen
picture = imread('Aufgabe1_SoSe_2018.png');

%Bild von 16-Bit in zwei 8-Bit Bilder aufteilen
picture1 = im2uint8(picture);
picture2 = im2uint8(swapbytes(picture));

%Bild um 90° drehen
picture2 = imrotate(picture2,90);

%Jede gerade Zeile umdrehen von picture2
picture2(2:2:end,:,:) = fliplr(picture2(2:2:end,:,:));

%Farben invertieren
picture2 = imcomplement(picture2);

%Anzeigen von picture1
figure(1)
imshow(picture2)


%Umwandeln von Violett in Blau im HSV-Raum
picture1hsv = rgb2hsv(picture1);
picture1hsv(picture1hsv(:,:,1)>0.7222 & picture1hsv(:,:,1)<0.7639) = picture1hsv(picture1hsv(:,:,1)>0.7222 & picture1hsv(:,:,1)<0.7639) - 0.1389;
picture1=hsv2rgb(picture1hsv);

%Anzeigen von picture2
figure(2)
imshow(picture1)