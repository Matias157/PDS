L = 5;
n = 0:L-1;
x = ones(size(n));

[X,W] = dtft(x,n);


figure(4)
subplot(2,1,1);
plot(W/pi, abs(X));
subplot(2,1,2);
plot(W/pi, angle(X));