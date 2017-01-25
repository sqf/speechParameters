function [] = spectrum(signal, Fs)
    window = hamming(512);
    noverlap = 256;
    nfft = 1024;
    [S,F,T,P] = spectrogram(signal, window, noverlap, nfft, Fs, 'yaxis');
    surf(T,F,10 * log10(P),'edgecolor','none'); axis tight; view(0,90);
    colormap(hot); set(gca,'clim',[-80 -30]); xlabel('Temps (Seconds)');
    ylabel('Frequnences Hz'); 
    colormap bone
    view(-45,65)
end

