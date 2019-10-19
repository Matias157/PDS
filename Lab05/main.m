N = [0, 1, 0, -1];
y = dft(N)

N = 0:3;
x = [cos((pi/2)*N)];
y = dft(x);

N = 0:7;
x = [5+2*cos((pi/2)*N)];
y = dft(x);

N = 0:11;
x = [1+3*cos((pi/3)*N)+sin((5*pi/6)*N)];
y = dft(x);