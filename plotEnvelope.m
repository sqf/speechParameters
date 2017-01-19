function [ ] = plotEnvelope( signal , Fs )

timeBase=[0:1/Fs:(size(signal,2)-1)/Fs] ;
    
    plot(timeBase, signal,timeBase, envelope(signal,300,'peak'));
end

