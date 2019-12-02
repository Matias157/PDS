A = [0, 1, 1, 0];
W = [.125, .2, .23]*pi;
K = length(W);

M = 40;
n = 0:M;
h = zeros(1,1);

eps = 1e-12;

for k = 1:K
     h = h + (A(k)-A(k+1))*sin(W(k)*(n+eps-M/2))./(pi*(n+eps-M/2));
end
 
[H, W] = freqz(h);
plot(W/pi, abs(H))
grid on;

N = 1:100;
T = 100;
for t = 1:T
    y(t) = cos((pi/10)*t) + cos((pi/5)*t) + cos((pi/2)*t);
    ideal(t) = cos((pi/5)*t);
end
figure;
stem(N, y)
figure;
stem(N, ideal)

saida = filter(h, 1, y);

figure;
stem(N, saida)