%
clear

%Bild einlesen
picture = imread('Aufgabe1.png');

%Bild von 16-Bit in zwei 8-Bit Bilder aufteilen
picture1 = im2uint8(picture);
picture2 = im2uint8(swapbytes(picture));

%Jede gerade Zeile umdrehen von picture2
picture2(2:2:end,:,:) = fliplr(picture2(2:2:end,:,:));

%Blau und Grün tauschen in picture2
newpicture2(:,:,1) = picture2(:,:,1);
newpicture2(:,:,2) = picture2(:,:,3);
newpicture2(:,:,3) = picture2(:,:,2);

%imshow(newpicture2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Testphase%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
imshow(picture1)

picture1hsv = rgb2hsv(picture1);
picture1hsv(find(picture1hsv(:,:,1)>0.09 & picture1hsv(:,:,1)<0.6)) = 0;
picture1=hsv2rgb(picture1hsv);

figure(3)
imshow(picture1)