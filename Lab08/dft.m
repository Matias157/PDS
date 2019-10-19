function X = dft(x)

N = length(x);
X = zeros(size(x));
W = exp(-1j*2*pi/N);

for k = 0:N-1
    for n=0:N-1
        e = k*n;
        a = W^e;
        X(k+1) = X(k+1) + x(n+1)*a;
    end
end
