Co = 7.50
r = 0.24 
D = 416;
C1 = 71.00;
MAT = zeros(2,9);

Q = {
Q1 = [0:0.05:99];
Q2 = [100:0.05:1000];
};

C2 = C1 - C1*0.02
C = [C1;C2]

t = 1;
while t <= 2
  d = D
  c = C(t)
  q = cell2mat(Q(t));
  CO = Co*(d./q);%Bs/semana
  CP = r*c*(q/2);%Bs/semana
  CT = CO + CP + c*d;%Bs/semana                                     Bs*unidad = Bs
  plot(q,CT)
  hold on
  t = t + 1;
endwhile

axis([0,200,20000,40000])
title("funcion de costos totales")
ylabel "CT"
xlabel "Q"
grid
li = {[0];[100];};
ls = {[99];[inf];};

output_precision(3)
t = 1;
while t <= 2
  c = C(t);
  q = cell2mat(Q(t));
  Qpri = sqrt((2*Co*D)/(r*c));
  LI = cell2mat(li(t));
  LS = cell2mat(ls(t));
  if Qpri <= LI
  Qast = LI;
  else if LI <= Qpri && Qpri <= LS
  Qast = Qpri;
  else if Qpri >= LI
  Qast=0;
  endif
  endif
  endif
  if Qast !=0
  q = Qast;
  CO = Co*(D./q);%Bs/semana
  CP = (r*c)*(q/2);%Bs/semana
  costosDEmanejo = CO + CP; %Bs/semana
  costoDEcompra = c*D; %Bs/semana
  costoTOTAL = costosDEmanejo + costoDEcompra;
  else
  costosDEmanejo = 0;
  costoDEcompra = 0;
  costoTOTAL = 0;
  endif
  MAT(t,:) = [LI,LS,c,r*c,Qpri,Qast,costosDEmanejo,costoDEcompra,costoTOTAL];
  t = t + 1;
endwhile
MAT
  
min(MAT(:,9)) 
min(CT)+0.06*min(CT)
i = 1
while CT(i) <= min(CT)+0.06*min(CT)
  i = i + 1;
end
i
Q2(i)




