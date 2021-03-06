close all;
clear all;

%signal= sin([0:0.4:200]).*sin([0:0.1:50]/3.1).*[0:0.01:5.0] + sin([0:1:500]).*[zeros(1,250),ones(1,251)];
%Fs=480;

[stereoSignal,Fs] = audioread('audio/a.wav');
signal = stereoSignal(:,1)';

plotEnvelope(signal,Fs);
%plotZeroCrossIntervalsHistogram(signal,Fs, 50);    
%plotZeroCrossDensityHistogram(signal,Fs, 50);    
%cepstralAnalysis(signal, Fs)
%size(generateMelFilterWindow( 5, 300, 20, 251))