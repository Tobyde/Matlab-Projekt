%3D Darstellung einer konischen Spirale
clear;
z=0:0.01:50;
r=(3/5)*z;
x=r.*sin(((2*pi)/5)*z);
y=r.*cos(((2*pi)/5)*z);

%Dreidimensionale Ansicht
figure(1);
plot3(x,y,z);
xlabel('x'), ylabel('y'), zlabel('Höhe'), grid;

%Draufsicht auf xy-Ebene
figure(2);
plot(x,y);
xlabel('x'), ylabel('y'), grid;