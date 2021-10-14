Ctotal = 0
Co = 5000%Bs/orden
r = 0.005%Bs/(Bs.semana)
C = 200%Bs/unidad
D = [96 84 0]%unidades/semana
P = [96 96 0]%unidades/semana
color={"b","r","g"}
for lin = [1:1:2]

T = [1:0.001:15];%semanas
Imax = (D(lin)/P(lin))*T*(P(lin)-D(lin));%unidades
Im = Imax/2;%unidades
CO = Co*(1./T);%Bs/semanas
CP = r*C*Im;%Bs/semanas
CT = CO + CP;%Bs/semanas
figure (1)
plot(T,CT,color{lin})
hold on
title("Rata de suministro finita")
xlabel("T(semanas)")
ylabel("CT(Bs/semana)")
[minCT,iminCT] = min(CT)
Ctotal=Ctotal+minCT;
Topt = T(iminCT)

T = Topt;
%T = 8
it = 0

while it <= 2
  figure (2)
  T1=(D(lin)/P(lin))*T;
  t = [T*it:0.01:T1+T*it];
  I = t*(P(lin)-D(lin)) - T*(P(lin) - D(lin))*it;
  plot(t,I,color{lin});hold on
  T2 = (1 - D(lin)/P(lin))*T;
  Imax = (D(lin)/P(lin))*T*(P(lin) - D(lin));%unidades
  t = [T1 + (T*it):0.01:T1 + T2 + (T*it)];
  I = -D(lin)*t + (Imax + (T1 + (T*it))*D(lin));
  plot(t,I,color{lin})
  it = it + 1;
endwhile

endfor 
xlabel "t(semanas)"
ylabel "I(unidades)"
grid
Ctotal