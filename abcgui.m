function abcgui(akcja)
global N n x w Nrokna Nrwykresu;

switch(akcja)
   case 'CzytajProbki'
      [st1,st2]=uigetfile('*.mat','Czytaj dane');
      if st1~=0
         eval(['load ''' [st2,st1] ''' -mat x']);
      end
      RysujWykres(Nrwykresu,N,n,x,w);      
   case 'Okno'
      Nrokna=get(findobj('Tag','listboxokno'),'Value');
      w=ObliczOkno(Nrokna,n,N);
      RysujWykres(Nrwykresu,N,n,x,w);
   case 'Wykres'
      Nrwykresu=get(findobj('Tag','listboxwykres'),'Value');
      RysujWykres(Nrwykresu,N,n,x,w);
     %get(findobj
   case 'wyswchki'
      okna;

end;

% Funkcje lokalne
function RysujWykres(Nrwykresu,N,n,x,w);
switch(Nrwykresu)
   case 1
      RysujWykres1(N,n,x,w);
   case 2
      RysujWykres2(N,n,x,w);
   case 3
      RysujWykres3(N,n,x,w);
   case 4
      RysujWykres4(N,n,x,w);
end;


function RysujWykres1(N,n,x,w);
hold off;
plot(n,x,'b.');
hold on;
plot(n,x,'b');
plot(n,w,'g.');
plot(n,w,'g');
plot(n,w.*x,'r.');
plot(n,w.*x,'r');

function RysujWykres2(N,n,x,w);
hold off;
sizex = size(x);
sizex = size(x);
 nmbrOfZeros = get(findobj('Tag', 'edit4'), 'String');
      nmbrOfZeros = str2num(nmbrOfZeros);
n=0:(N/(sizex(2) + nmbrOfZeros)):(sizex(2)-N/(sizex(2) + nmbrOfZeros));
f=fft(x, sizex(2) + nmbrOfZeros);
sizexw = size(x.*w);
f1=fft(x.*w, sizexw(2) + nmbrOfZeros);
%n(end+1:rozmiarx(2) + 128)=0
%n(129) = 128;
%n(130) = 129;
%charakterystyka amplitudowa
modf=abs(f)/(N/2);
modf1=abs(f1)/(N/2);
ind=find(modf<=0.00001);
plot(n,modf, 'r.') %'r.'
hold on
plot(n, modf1, 'b.')
title('charakterystyka amplitudowa')
xlabel('Hz')
ylabel('amplituda');


function RysujWykres3(N,n,x,w);
sizex = size(x);
sizexw = size(x.*w);
sizex = size(x);
 nmbrOfZeros = get(findobj('Tag', 'edit4'), 'String');
      nmbrOfZeros = str2num(nmbrOfZeros);
n=0:(N/(sizex(2) + nmbrOfZeros)):(sizex(2)-N/(sizex(2) + nmbrOfZeros));
f=fft(x.*w, sizexw(2) + nmbrOfZeros);
modf=abs(f)/(N/2);
hold off;
plot(n,20*log10(modf),'g.');
hold on;
plot(n,20*log10(modf),'g');
axis([0 N-1 -100 0]);

function RysujWykres4(N,n,x,w);
sizex = size(x);
 nmbrOfZeros = get(findobj('Tag', 'edit4'), 'String');
      nmbrOfZeros = str2num(nmbrOfZeros);
%nmbrOfZeros = 128;
hold off;
n=0:(N/(sizex(2) + nmbrOfZeros)):(sizex(2)-N/(sizex(2) + nmbrOfZeros));
f=fft(x, sizex(2) + nmbrOfZeros);
modf=abs(f)/(N/2);
ind=find(modf<=0.00001);
fazf=angle(f)+(pi/2);
fazf(ind)=NaN;
plot(n,fazf,'k.')
title('charakterystyka fazowa')
xlabel('Hz')
ylabel('radiany')

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
