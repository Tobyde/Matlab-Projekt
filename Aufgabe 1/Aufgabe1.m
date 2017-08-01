%
clear

%Bild einlesen
picture = imread('Aufgabe1.png');

%Bild von 16-Bit in zwei 8-Bit Bilder aufteilen
picture1 = im2uint8(picture);
picture2 = im2uint8(swapbytes(picture));

%Jede gerade Zeile umdrehen von picture2
picture2(2:2:end,:,:) = fliplr(picture2(2:2:end,:,:));

%Rot und Grün tauschen in picture2
newpicture2(:,:,1) = picture2(:,:,1);
newpicture2(:,:,2) = picture2(:,:,3);
newpicture2(:,:,3) = picture2(:,:,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imshow(newpicture2)
%bild=rgb2hsv(picture1);
