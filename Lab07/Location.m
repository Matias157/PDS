load(fullfile(matlabroot,'examples','signal','Ring.mat'))

Time = 0:1/Fs:(length(y)-1)/Fs; 

m = min(y);
M = max(y);

Full_sig = double(y);
%soundsc(Full_sig,Fs);

timeA = 7;
timeB = 8;

%Fragment = Full_sig(snip);
load('atividade_xcorr.mat');
Fragment = double(x);
%soundsc(Fragment,Fs)



NoiseAmp = 0.2*max(abs(Fragment));

Full_sig = Full_sig+NoiseAmp*randn(size(Full_sig));

% To hear, type soundsc(Fragment,Fs)

plot(Time,Full_sig,[timeA timeB;timeA timeB],[m m;M M],'r--')
xlabel('Time (s)')
ylabel('Noisy')
axis tight


figure(2)
[xCorr,lags] = xcorr(Full_sig,Fragment);

plot(lags/Fs,xCorr)
grid
xlabel('Lags (s)')
ylabel('Noisy')
axis tight

[~,I] = max(abs(xCorr));
maxt = lags(I);

Trial = NaN(size(Full_sig));
Trial(maxt+1:maxt+length(Fragment)) = Fragment;

figure
plot(Time,Full_sig,Time,Trial)
xlabel('Time (s)')
ylabel('Noisy')
axis tight