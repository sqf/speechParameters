function [] = plotZeroCrossDensity( signal, Fs )
monoSignal = signal(:,1)' ;  

timeBase=[0:1/Fs:(size(monoSignal,2)-1)/Fs] ;    
   
   windowWidthHalf = 50;
   
   for i = 1:size(monoSignal,2)-1
       if (monoSignal(i) > 0 && monoSignal(i+1) < 0)||(monoSignal(i) < 0 && monoSignal(i+1) > 0)
        zeroCrossFunction(i) = 1;
       else
           zeroCrossFunction(i)=0;
       end
   end
   zeroCrossFunction(size(monoSignal,2))=0;
  
   for i = windowWidthHalf + 1 : size(monoSignal,2) - windowWidthHalf
       zeroCrossDensity(i) = sum(zeroCrossFunction((i - windowWidthHalf) :(i + windowWidthHalf)));
   end
   
   for i = [1:windowWidthHalf, size(monoSignal,2) - windowWidthHalf :size(monoSignal,2)]
       zeroCrossDensity(i) = 0;
   end
   
   plot(timeBase, monoSignal, timeBase, zeroCrossDensity);
end

