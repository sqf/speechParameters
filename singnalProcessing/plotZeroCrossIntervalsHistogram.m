%return intervals in seconds
function [zeroCrossDensity] = plotZeroCrossIntervalsHistogram( signal, Fs, windowWidth)
   timeBase=[0:1/Fs:(size(signal,2)-1)/Fs] ;    

   for i = 1:size(signal,2)-1
       if (signal(i) > 0 && signal(i+1) < 0)||(signal(i) < 0 && signal(i+1) > 0)
        zeroCrossFunction(i) = 1;
       else
           zeroCrossFunction(i)=0;
       end
   end
   
   zeroCrossFunction(size(signal,2))=0;
   for i = 1 : size(signal,2)/windowWidth
       zeroCrossInterval(i) = sum(zeroCrossFunction(i : (i + windowWidth))) / windowWidth /Fs;
   end
   
%plot(zeroCrossInterval);

histogram(zeroCrossInterval);
end

