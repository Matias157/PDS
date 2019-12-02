%% Aproximando sinal no tempo contínuo
Finf = 10e3;
T = 20000;
t_end = (T-1)/Finf;
t = 0:1/Finf:t_end;
xc = cos(2*pi*440*t) - .9*cos(2*pi*2440*t);
sound(xc,Finf);
pause(t_end);

%% Amostrando sinal
Fs = 2e3;
Ts = 1/Fs;
ts = 1:(Finf/Fs):T;
x = xc(ts);
sound(x,Fs);
pause(t_end);

Xc = fft(xc);
F = (0:length(Xc)-1)*Finf/length(Xc);
figure(1); plot(F, abs(Xc)/length(Xc));
title("Antes da amostragem");

X = fft(x);
F = (0:length(X)-1)*Fs/length(X);
figure(2); plot(F, abs(X)/length(X));
title("Depois da amostragem");