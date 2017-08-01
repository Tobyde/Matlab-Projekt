clear;
swbild=imread('Aufgabe4.png');
genpol = [12 8 2 0];
initwert = [1 0 0 0 1 0 0 0 0 0 1 0];
pnSequence = comm.PNSequence('Polynomial',genpol, ...
    'SamplesPerFrame',12,'InitialConditions',initwert);

x1=step(pnSequence);
x2=step(pnSequence);
x3=step(pnSequence);
x4=step(pnSequence);
x5=step(pnSequence);
x6=step(pnSequence)
x7=step(pnSequence)
x8=step(pnSequence)
x9=step(pnSequence)
x10=step(pnSequence)
x11=step(pnSequence)
x12=step(pnSequence)
x13=step(pnSequence)


plot(initwert,x1,initwert,x2)
%swbild1=xor(swbild,x1)