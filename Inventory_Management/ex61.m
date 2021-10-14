D = 14
T = [1:1:9]
k = T/7.39
a = (0.5*((1./k)+k)-1)*100
Q = T*D
T = 8

h = 2*85; %Bs/(unidad.año)
i = 0.22;%Bs/(Bs.unidad)
C = 8500; %Bs/unidad
Cp = h + i*C; %Bs/(unidad.año)
Cp = Cp/52; %Bs/(unidad.semana)
r  = Cp/C;
Co = 15000; %Bs/orden

CT = Co*(1./T) + Cp*(T*D)/2;%BS/semana
CT = CT*52 %Bs/año

