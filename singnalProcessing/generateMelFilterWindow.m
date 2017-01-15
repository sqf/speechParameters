% filterWidthMel - in mel
% maxFrequencyHz - in Hz
% outputVectorWidth - in samples

function [ filterWindow] = generateMelFilterWindow( filterIndex, filterWidthMel, maxFrequencyHz, outputVectorWidth)
    filterWindow = zeros(1,outputVectorWidth);
    
    startFrequencyHz = mel2hz(filterIndex * filterWidthMel/2 - filterWidthMel/2);
    centerFrequencyHz = mel2hz(filterIndex * filterWidthMel/2);
    endFrequencyHz = mel2hz(filterIndex * filterWidthMel/2 + filterWidthMel/2);
    
    hzPerSample = outputVectorWidth / maxFrequencyHz;
    
    startSample = 1+round(startFrequencyHz / maxFrequencyHz * outputVectorWidth)
    centerSample = 1+round(centerFrequencyHz / maxFrequencyHz * outputVectorWidth)
    endSample = 1+round(endFrequencyHz / maxFrequencyHz * outputVectorWidth)
    
    filterWindow(startSample:centerSample) = [0:1/(centerSample-startSample):1];
    filterWindow(centerSample:endSample) = [1:-1/(endSample-centerSample):0];
    %plot(filterWindow);
end


function [hz] = mel2hz (mel)
    hz = 700*(10^(mel/2595)-1)
end