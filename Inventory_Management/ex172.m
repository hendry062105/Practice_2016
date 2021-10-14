Co = 5000%Bs/orden
r = 0.005%Bs/(Bs.semana)
C = 200%Bs/unidad
D = 180%unidades/semana
P = 288%unidades/semana

T = [1:0.001:15];%semanas
Imax = (D/P)*T*(P-D);%unidades
Im = Imax/2;%unidades
CO = Co*(1./T);%Bs/semanas
CP = r*C*Im;%Bs/semanas
CT = CO + CP;%Bs/semanas
plot(T,CT)
title("Rata de suministro finita")
xlabel("T(semanas)")
ylabel("CT(Bs/semana)")
[minCT,iminCT] = min(CT)

Topt = T(iminCT)

T = Topt;
it = 0
while it <= 3
  figure (2)
  T1 = (D/P)*T;
  t = [T*it:0.01:T1 + T*it];
  I = t*(P - D) - T*(P - D)*it;
  plot(t,I);hold on
  T2=(1 - D/P)*T;
  Imax = (D/P)*T*(P - D);%unidades
  t = [T1 + (T*it):0.01:T1 + T2 + (T*it)];
  I = -D*t + (Imax + (T1 + (T*it))*D);
  plot(t,I)
  it = it + 1;
endwhile
xlabel "t(semanas)"
ylabel "I(unidades)"
grid


