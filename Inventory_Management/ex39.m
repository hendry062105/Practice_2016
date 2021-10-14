%T = 3 %semana
D = 400 %kg/semana
CT = 0 %

h = 0.70 %Bs/(unidad.año)
i = 0.19 %Bs/(Bs.unidad)
C = 10 %Bs/unidad
Cp = h + i*C %Bs/(unidad.año)
Cp = Cp/52 %Bs/(unidad.semana)
r = Cp/C
Co = 50 %Bs/orden

T = [1:0.1:10];%semana
CT = Co*(1./T) + Cp*(T*D)/2; %Bs/año
plot(T,CT)
%axis([1,10,2000,16000]) 
grid

CTmin = min(CT) %Bs/semana
