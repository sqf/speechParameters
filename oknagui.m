function oknagui(akcja)
global N n x w Nrokna Nrwykresu;

switch(akcja)
 
   case 'Okna'
      Nrokna=get(findobj('Tag','listboxokna'),'Value');
      w=ObliczOkno(Nrokna,n,N);
      w = w*N/sum(w);
      RysujWykr(N,n,x,w);

end;

% Funkcje lokalne
function RysujWykr(N,n,x,w);

sizex = size(x);
sizexw = size(x.*w);
sizex = size(x);
 nmbrOfZeros = 128*16;%get(findobj('Tag', 'edit4'), 'String');
      %nmbrOfZeros = str2num(nmbrOfZeros);
n=0:(N/(sizex(2) + nmbrOfZeros)):(sizex(2)-N/(sizex(2) + nmbrOfZeros));
f=fft(w, sizexw(2) + nmbrOfZeros);
modf=abs(f)/(N);
hold off;
plot(n,20*log10(modf),'g.');
hold on;
plot(n,20*log10(modf),'g');
%axis([0 N-1 -100 0]);

function w=ObliczOkno(Nrokna,n,N);
switch(Nrokna)
   case 1 % prostokatne
      w=ones(1,N);
   case 2 % Haninnga
      w=1-cos(2*pi*n./N);
   case 3 % trojkatne
      w = (triang(N))';
   case 4 % Barletta
      w = (bartlett(N))';
   case 5 % Bartlett-Hann
      w = (barthannwin(N))';
   case 6 % Chebyshev
      ra1 = get(findobj('Tag', 'edit1'), 'String');
      ra2 = str2num(ra1);
      w = (chebwin(N,ra2))';
   case 7 % Kaiser
      kais = get(findobj('Tag', 'edit2'), 'String');
      kais = str2num(kais);
      w = (kaiser(N,kais))';
   case 8 % Gaussian
      gauss = get(findobj('Tag', 'edit3'), 'String');
      gauss = str2num(gauss);
      w = (gausswin(N,gauss))';
     
      
end;