A = [0, 1, 0.5, 0];
W = [0.225*pi, 0.525*pi, 0.75*pi];
M = 124;
L = M + 1;
m = (0:M);

hd = zeros(1, M+1);
for k = 1:length(W)
    hd = hd + (A(k)-A(k+1))*sinc2(m -(M/2), W(k));
end

h = hd.*hann(L)';
[H,W] = freqz(h,1,1024);
H = abs(H);
delta = max(H)-1;
figure; 
plot(W/pi,H); 
grid on;

N = 1:500;
T = 500;
for t = 1:T
    y(t) = cos((pi/10)*t) + cos((2*pi/5)*t) + cos((2*pi/3)*t) + cos((9*pi/10)*t);
    ideal(t) = 0*cos((pi/10)*t) + cos((2*pi/5)*t) + 0.5*cos((2*pi/3)*t) + 0*cos((9*pi/10)*t);
end
figure;
stem(N, y)
figure;
stem(N, ideal)

saida = filter(h, 1, y);
figure;
stem(N, saida)