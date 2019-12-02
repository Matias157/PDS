wp = 0.4*pi;
ws = 0.6*pi;
dp = 0.05;
ds = 0.05;

N = (-20*log10(sqrt(dp*ds))-13)/(14.6*(ws-wp)/pi);
N = ceil(N);
n = -N:N;

wc = (wp+ws)/2;
h = sin(wc*n)./(pi*n);
h(n==0) = wc/pi;

K = 100*N;
k = 0:K-1;
w = 2*pi*k/K;

for i=1:30
    H = fft(h,K);
    phi = phase(H);
    H = abs(H);

    plot(w,abs(H));
    hold on;
    plot([0,wp,wp,0],[1+dp,1+dp,1-dp,1-dp]);
    plot([ws,ws,2*pi-ws,2*pi-ws],[0,ds,ds,0]);
    plot([2*pi,2*pi-wp,2*pi-wp,2*pi],[1-dp,1-dp,1+dp,1+dp]);
    hold off; drawnow; pause(.5);
    
    H(H > 1+dp & (w < wp | w > 2*pi-wp)) = 1+dp;
    H(H < 1-dp & (w < wp | w > 2*pi-wp)) = 1-dp;
    H(H > ds & w > ws & w < 2*pi-ws) = ds;

    h = ifft(H.*exp(1j*phi),'symmetric');
    h = h(1:2*N+1);
end