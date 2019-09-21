L = 5;
n = 0:L-1;
x = ones(size(n));

figure(1);
stem(n, x);

M = 1024;
w = linspace(-pi,pi,M);
X = (sin(w*L/2)./sin(w/2)).*exp(-1j*w*(L-1)/2);

figure(2);
plotyy(w/pi,abs(X),w/pi,angle(X));

A = sin(w*L/2)./sin(w/2);
psi = -w*(L-1)/2;

figure(3)
plotyy(w/pi,A,w/pi,psi);