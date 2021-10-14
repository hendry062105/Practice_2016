Co = 7.50;%Bs/orden
r = 0.24;%Bs/(Bs.unidad.año)
D = [4160 104 416];%unidades/año

C1 = [12.00 15.00 71.00];%Bs/año
C2 = C1 - 0.02*C1;%Bs/año

Q1 = [0:0.05:99];%unidades
Q2 = [100:0.05:20000];%unidades
  Q = [Q1 Q2];%unidades


t = 1;
while t <= 3
  figure (t)
  CO1 = Co*(D(t)./Q1);%Bs/semana
  CP1 = r*C1(t)*(Q1/2);%Bs/semana
  costosDEmanejo1 = CO1 + CP1;
  CT1 = CO1 + CP1 + C1(t)*D(t);%Bs/semana                                     Bs*unidad = Bs
  hold on
  CO2 = Co*(D(t)./Q2);%Bs/semana
  CP2 = r*C2(t)*(Q2/2);%Bs/semana
  costosDEmanejo2 = CO1 + CP1;
  CT2 = CO2 + CP2 + C2(t)*D(t);%Bs/semana     
  plot(Q1,CT1,Q2,CT2);%CON UNA SOLA ITERACIÓN SE CONSTRUYEN DOS GRÁFICAS A LA VÉS.
  xlabel("Q(unidades)")
  ylabel("CT(Bs)")
  
  CT = [CT1 CT2];%Bs/año
  costosDEmanejo = [costosDEmanejo1,costosDEmanejo2];%Bs/año
  
  [minCT,iminCT] = min(CT);%Bs/año
  QminCT = Q(iminCT)%unidades
  minCT%Bs/año
  TminCT = 52*QminCT/D(t)%semanas
  
  %ÁNALISIS DE SENSIBILIDAD
  
  i = 0;
  while CT(i + iminCT) <= minCT + 0.06*costosDEmanejo
  i = i - 1;
  endwhile  
  Q6porc = Q(i + iminCT)%unidades
  T6porc = Q6porc/D(t)*52%semanas
  i = 0;
  while CT(i + iminCT) <= minCT + 0.06*costosDEmanejo
  i = i + 1;
  endwhile
  Q6porc = Q(i + iminCT)%unidades
  T6porc = Q6porc/D(t)*52%semanas
  display("---------------------------")
   
t = t + 1;
endwhile



