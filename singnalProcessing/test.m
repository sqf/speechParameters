signal= sin([0:0.4:200]).*sin([0:0.1:50]/3.1).*[0:0.01:5.0] + sin([0:1:500]).*[zeros(1,250),ones(1,251)];
Fs=48000;

%plotEnvelope(signal,Fs);
plotZeroCrossIntervalsHistogram(signal,Fs, 50);    