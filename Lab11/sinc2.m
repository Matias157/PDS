function y = sinc2(x, wc)

y = sin(wc*x)./(pi*x);
y(x==0) = wc/pi;

end