

function [discreteCosineTransform ] = cepstralAnalysis(signal, fs)
    filterWidthMel = 300;
    filterCount = 16;
    fourier = abs(fft(signal));
    figure(1);
    clf
    frequencies = [0:fs/size(fourier,2):fs]
    fourierHalfSize = round(size(fourier,2)/2)
    
    fourierHalf = fourier(1:fourierHalfSize)
    
    subplot(4,1,1);
    plotSampleCount = round(size(fourierHalf,2))/3;
    plot(frequencies(1:plotSampleCount),fourierHalf(1:plotSampleCount));
     title('spectrum');
     xlabel('[Hz]');
     
    subplot(4,1,2);
    title('filters');
    xlabel('[Hz]');
    hold on;
    for i = [1:filterCount]
       melFilterWindow = generateMelFilterWindow(i, filterWidthMel, fs/2, size(fourierHalf,2));
       plot (frequencies(1:plotSampleCount), melFilterWindow(1:plotSampleCount),'-c');
       energy(i) = sum(fourierHalf .* melFilterWindow)^2;
    end
    
    hold off;
    
    subplot(4,1,3);
    bar(energy);
    title('energy in each filter');
    xlabel('filter index');
    subplot(4,1,4);
    discreteCosineTransform = dct(energy);
    bar(discreteCosineTransform );
    title('discrete cosine transform');
end