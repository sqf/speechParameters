function [] = plotZeroCrossDensity( signal, Fs )
   timeBase=[0:1/Fs:(size(signal,2)-1)/Fs] ;    
   
   windowWidthHalf = 50;
   
   for i = 1:size(signal,2)-1
       if (signal(i) > 0 && signal(i+1) < 0)||(signal(i) < 0 && signal(i+1) > 0)
        zeroCrossFunction(i) = 1;
       else
           zeroCrossFunction(i)=0;
       end
   end
   zeroCrossFunction(size(signal,2))=0;
  
   for i = windowWidthHalf + 1 : size(signal,2) - windowWidthHalf
       zeroCrossDensity(i) = sum(zeroCrossFunction((i - windowWidthHalf) :(i + windowWidthHalf)));
   end
   
   for i = [1:windowWidthHalf, size(signal,2) - windowWidthHalf :size(signal,2)]
       zeroCrossDensity(i) = 0;
   end
   
   plot(timeBase, signal, timeBase, zeroCrossDensity);
end

