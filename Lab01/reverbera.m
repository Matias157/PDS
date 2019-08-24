clear;
rec = false;

if rec
	recObj = audiorecorder;
	disp('Start speaking.')
    recordblocking(recObj,7);
    disp('End of speaking.');
    x = getaudiodata(recObj);
    Fs = recObj.SampleRate;
else
    load('handel');
    x = y;
    clear y;
end

b = [1];
tau = 0.05;
D = tau * Fs;
a = [1,zeros(1,round(D)),0.7];
 
y = filter (b,a,x);
sound(y, Fs);



