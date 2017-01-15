function [ ] = plotEnvelope( signal , Fs )
Fs
monoSignal = signal(:,1)' ;
timeBase=[0:1/Fs:(size(monoSignal,2)-1)/Fs] ;
    y = hilbert(monoSignal);
    
    env = abs(y);
    figure();
    plot(timeBase,monoSignal,timeBase, env);
end

