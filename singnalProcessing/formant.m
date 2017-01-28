function [ffreq] = formant(signal, fs)
% resample to 10,000Hz (optional)
signal=resample(signal,10000,fs);
fs=10000;
%

% plot waveform

t=(0:length(signal)-1)/fs;       % times of sampling instants
% figure
% subplot(2,1,1);
% plot(t,signal);
%  legend('Przebieg');
%  xlabel('Czas (s)');
%  ylabel('Amplituda');
% %
% get Linear prediction filter
ncoeff=2+fs/1000;           % rule of thumb for formant estimation
a=lpc(signal,ncoeff);
%
% plot frequency response
[h,f]=freqz(1,a,512,fs);
figure
subplot(2,1,2);
plot(f,20*log10(abs(h)+eps));
% legend('LP Filter');
 xlabel('Frequency (Hz)');
 ylabel('Gain (dB)');

% find frequencies by root-solving

r=roots(a);                  % find roots of polynomial a
r=r(imag(r)>0.01);           % only look for roots >0Hz up to fs/2
ffreq=sort(atan2(imag(r),real(r))*fs/(2*pi));
% convert to Hz and sort
% descr = {'Plot of the function:';
%     'y = A{\ite}^{-\alpha{\itt}}';
%     ' ';
%     'With the values:';
%     'A = 0.25';
%     '\alpha = .005';
%     't = 0:1000'};
    
%axes(x) % sets ax1 to current axes

% descr1 = {'Kolejne częstotliwości formantowe'}
% text(-.025,40+15*6,descr1)
for i=1:length(ffreq)
    description = strcat('nr:',num2str(i));
    descr = {description;
        ffreq(i)};
%     text(0,90-10*i,descr)
    text(ffreq(i),0,descr)
    vline(ffreq(i),'g','')
    fprintf('Formant %d Frequency %.1f\n',i,ffreq(i));
end

end

