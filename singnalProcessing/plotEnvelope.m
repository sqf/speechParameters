function [ ] = plotEnvelope( signal , Fs )
    timeBase=[0:1/Fs:(size(signal,2)-1)/Fs] ;    
    
    y = hilbert(signal);
    env = abs(y);
    plot(timeBase, signal,timeBase, env);
end

