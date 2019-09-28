N = 16;
n = 0:N-1;
x = cos(n*pi/5) + 3*cos(n*5*pi/7);
[Xdtft,wdtft] = dtft(x/N,n);
Xdft = fft(x/N);
wdft = linspace(0,2*pi-2*pi/N,N);
plot(wdtft,abs(Xdtft));
hold on;
stem(wdft,abs(Xdft));
% Zero-padding
% x = cos(n*7*pi/35) + 3*cos(n*25*pi/35);
% x = cos(n*7*2*pi/70) + 3*cos(n*30*2*pi/70);
M = 70;
K = M - N;
x_zp = [x, zeros(1,K)];
X_zp = fft(x_zp/N);
w_zp = linspace(0,2*pi-2*pi/M,M);
stem(w_zp,abs(X_zp));
% Mais amostras
N = M;
n = 0:N-1;
x = cos(n*pi/5) + 3*cos(n*5*pi/7);
[Xdtft,wdtft] = dtft(x/N,n);
Xdft = fft(x/N);
wdft = linspace(0,2*pi-2*pi/N,N);
figure;
plot(wdtft,abs(Xdtft));
hold on;
stem(wdft,abs(Xdft));