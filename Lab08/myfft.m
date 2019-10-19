function X = myfft(x)

N = length(x);
M = log2(N);

if M - round(M)
    error('Not 2^p');
end

if N > 1
    wn = exp(-1j*2*pi/N);
    w = 1;
    Xe = myfft(x(1:2:end));
    Xo = myfft(x(2:2:end));
    for k = 1:(N/2)
        X(k) = Xe(k) + Xo(k).*w;
        X(k+(N/2)) =  Xe(k) - Xo(k).*w;
        w = w.*wn;
    end
else
    X = x;
end