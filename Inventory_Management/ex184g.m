Ctotal = [0 0 0 0 0 0]
k = [0 0 0 0 0 0]
Co = 2000%Bs/orden
r = 0.005%Bs/(Bs.semana)
C = 30%Bs/unidad
D = [1200]%unidades/semana
P = [1200 1500 1800 2400 3000 3600]%unidades/semana
color = {"b","r","g","c","k","m"};

for lin = [1:1:6]

T = [1:0.01:15];%semanas
Imax = (D(1)/P(lin))*T*(P(lin) - D(1));%unidades
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
Ctotal(lin) = minCT;
k(lin) = P(lin)/D;
Topt = T(iminCT)

T = Topt;
%T = 8
it = 0

while it <= 2
  figure (2)
  T1 = (D(1)/P(lin))*T;
  t = [T*it:0.01:T1 + T*it];
  I = t*(P(lin)  -D(1)) - T*(P(lin) - D(1))*it;
  plot(t,I,color{lin});hold on
  T2 = (1 - D(1)/P(lin))*T;
  Imax = (D(1)/P(lin))*T*(P(lin) - D(1));%unidades
  t = [T1 + (T*it):0.01:T1 + T2 + (T*it)];
  I = -D(1)*t + (Imax +(T1 + (T*it))*D(1));
  plot(t,I,color{lin})
  it = it + 1;
endwhile

endfor 
xlabel "t(semanas)"
ylabel "I(unidades)"
grid
figure(3)
Ctotal
k
plot(k,Ctotal)
grid