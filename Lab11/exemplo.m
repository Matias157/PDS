M = 60;
n = (0:M)';
hd = sinc2(n-M/2,0.3*pi);
h = hd.*kaiser(M+1,4.5335);
freqz(h);