%Aufgabe 3
clear all
hold off

%Definition der Winkel
phi = 0:pi/20:2*pi;         %Elevationswinkel
theta = 0:pi/20:pi;         %Azimutwinkel

[U,V] = meshgrid(phi,theta);

%Halbkugel 1
X1 =3 + sin(V).*cos(U./2);
Y1 =3 +  sin(V).*sin(U./2);
Z1 =3 +  cos(V);

%Halbkugel 2
X2 = 1 + 2.*(sin(V).*cos(U./2));
Y2 = 5 + 2.*(sin(V).*sin(U./2));
Z2 = 0 + 2.*cos(V);

%Halbkugel 3
X3 = 2 + 0.5.*(sin(V).*cos(U./2));
Y3 = 2 + 0.5.*(sin(V).*sin(U./2));
Z3 = 2 + 0.5.*cos(V);

%Halbkugel 4
X4 = 0 + 1.5.*(sin(V).*cos(U./2));
Y4 = -2 + 1.5.*(sin(V).*sin(U./2));
Z4 = -2 + 1.5.*cos(V);

%Halbkugel 5
X5 = -4 + 4.*(sin(V).*cos(U./2));
Y5 = 0 + 4.*(sin(V).*sin(U./2));
Z5 = -4 + 4.*cos(V);

%Plot der Halbkugeln
figure(1)
h = surf(X1,Y1,Z1,'FaceColor','red'),hold on;
i = surf(X2,Y2,Z2,'FaceColor','blue'),hold on;
j = surf(X3,Y3,Z3,'FaceColor','black'),hold on;
k = surf(X4,Y4,Z4,'FaceColor','yellow'),hold on; 
l = surf(X5,Y5,Z5,'FaceColor','green'),hold on; 

%Rotation der Halbkugeln
rotate(h,[1 1 0],165)
rotate(i,[0 1 1],81)
rotate(j,[1 0 0],63)
rotate(k,[1 0 1],255)
rotate(l,[0 1 1],321)

%Anpassen der Achsen
axis equal


