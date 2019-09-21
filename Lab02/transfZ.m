k = 50;
N = 2*k+1;
n = -(N-1)/2:(N-1)/2;

x = degrau(n);
h = ((1/2).^n).*degrau(n);
yn = conv(x, h, 'same');
ya = 2*degrau(n) - ((1/2).^n).*degrau(n);

stem(n, yn);
hold on;
stem(n, ya);
e = ya - yn;
mean(e.^2);