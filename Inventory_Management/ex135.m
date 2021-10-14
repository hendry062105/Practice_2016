D = 400;%unidad/semana
Co = 50;%Bs/orden
h = 0.70/52;%Bs/unidad/semana
i = 0.19/52;%Bs/unidad/semana
minCT = zeros(1,5);
t = 1;
MAT = zeros(5,9);

Q = {Q1 = [0:0.05:499];Q2 = [500:0.05:1999];Q3 = [2000:0.05:4999];Q4 = [5000:0.05:9999];Q5 = [10000:0.05:12000];};

C={C1 = 10.20;C2 = 10.10;C3 = 10.00;C4 = 9.90;C5 = 9.80;};

t = 1;
while t <= 5
q = cell2mat(Q(t));
c = cell2mat(C(t));
  CO = Co*(D./q);%Bs/semana
  CP = (h + i*c)*(q/2);%Bs/semana
  CT = CO + CP + c*D;%Bs/semana                                     Bs*unidad = Bs
  plot(q,CT)
  hold on
t = t + 1;
endwhile
   axis([0,12000,3900,4300])
   title("funcion de costos totales")
   ylabel "CT"
   xlabel "Q"
   grid
   
li = {[0];[500];[2000];[5000];[10000];};

ls={[499];[1999];[4999];[9999];[inf];};

output_precision(3)

t = 1;
while t <= 5
  c = cell2mat(C(t));
  q = cell2mat(Q(t));
  Cp = (h + i*c);
  Qpri = sqrt((2*Co*D)/Cp);
  LI = cell2mat(li(t));
  LS = cell2mat(ls(t));
  if Qpri <= LI
  Qast = LI;
       else if LI <= Qpri && Qpri <= LS
       Qast = Qpri;
             else if Qpri >= LI
            Qast = 0;
             endif
       endif
  endif
  if Qast !=0
  q = Qast;
  CO = Co*(D./q);%Bs/semana
  CP = (h + i*c)*(q/2);%Bs/semana
  costosDEmanejo = CO + CP; %Bs/semana
  costoDEcompra = c*D; %Bs/semana
  costoTOTAL = costosDEmanejo + costoDEcompra;
  else
  costosDEmanejo = 0;
  costoDEcompra = 0;
  costoTOTAL = 0;
  endif
  MAT(t,:) = [LI,LS,c,Cp,Qpri,Qast,costosDEmanejo,costoDEcompra,costoTOTAL];
  t = t + 1;
endwhile
MAT
  
c = mean(cell2mat(C))
Cp = (h + i*c);
  Qpri = sqrt((2*Co*D)/Cp)
  

