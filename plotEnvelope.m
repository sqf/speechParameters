function [ ] = plotEnvelope( signal , Fs )

timeBase=[0:1/Fs:(size(signal,2)-1)/Fs] ;
    
    figure();
    plot(timeBase, signal,timeBase, envelope(signal));
end

