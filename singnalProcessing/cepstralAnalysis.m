

function [] = cepstralAnalysis(signal, fs)
    filterWidthMel = 300;
    filterCount = 20;
    fourier = abs(fft(signal));
    figure(1);
    plot(fourier);
    fourierHalfSize = round(size(fourier,2)/2)
    
    fourierHalf = fourier(1:fourierHalfSize)
    figure(2);
    plot(fourierHalf);
  
    figure(3);
    aaa = size(fourierHalf)
    bbb = size(generateMelFilterWindow(2, filterWidthMel, fs/2, size(fourierHalf,2)))
    for i = [1:filterCount]
       
       
       energy(i) = sum(fourierHalf .* generateMelFilterWindow(i, filterWidthMel, fs/2, size(fourierHalf,2)));
    end
    energy
    
    plot(energy);
end