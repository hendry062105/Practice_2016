D = 9000;%unidad/año
Co = 125;%Bs/orden
r = 0.20; %Bs/(Bs.año.unidad) %unidad??

Q = {%unidades
Q1 = [0:0.01:1999];
Q2 = [2000:0.01:4000]
};
Q12 = [Q1 Q2];

C = {%Bs/unidad
C1 = 1.25;
C2 = 1.80
};

output_precision(3)

t = 1;
while t <= 2
  CO = Co*(D./Q{t});%Bs/año
  CP = (r*C{t})*(Q{t}/2);%Bs/año
  CT = CO + CP + C{t}*D;%Bs/año                                    Bs*unidad = Bs
  plot(Q{t},CT)
  hold on
  [minCT,i] = min(CT)%Bs/año
  QminCT = Q12(i)%unidaes
  TminCT = (QminCT/D)*12%meses
t = t + 1;
endwhile
   axis([0,4000,5000,30000])
 %  axis([2000,3000,15000,20000])
   title("funcion de costos totales")
   ylabel "CT"
   xlabel "Q"
   grid
   
   disp("resp")
   