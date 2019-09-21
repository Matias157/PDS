%LAB 4 
T = 2;
Fs = 8192;
F1 = 440;
F2 = 1000;
r = 0.95;

N = T * Fs;
n = 0:N-1;
w1 = 2*pi*(F1/Fs);
w2 = 2*pi*(F2/Fs);
x1 = cos(w1.*n);
x2 = cos(w2.*n);
sound(x1, Fs);
pause;
x = x1+x2;
sound(x, Fs);
pause;

w0 = w2;%2*pi/F2;

b0 = (1+2*r*cos(w0)+r*r)/(2+2*cos(w0));

a = [1, -2*r*cos(w0), r*r];
b = [1 , - 2*cos(w0) , 1];

freqz(b0.*b,a,N)
y = filter(b0.*b, a, x);
sound(y, Fs);
pause