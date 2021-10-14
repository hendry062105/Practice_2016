Ctotal=0
Co = 2000%Bs/orden
r = 0.005%Bs/(Bs.semana)
C = 30%Bs/unidad
D = [1200]%unidades/semana
P = [3000]%unidades/semana
color={"b","r","g"};

Imax = 3500
T=Imax/((D/P)*(P-D))%unidades

Im = Imax/2;%unidades
CO = Co*(1/T)%Bs/semanas
CP = r*C*Im%Bs/semanas
CT = CO + CP%Bs/semanas