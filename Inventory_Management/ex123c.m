%T = 3 %semana
D = 1200 %kg/semana
CT = 0 %

h = 0.25 %Bs/(unidad.año)
i = 0.20 + 0.05 %Bs/(Bs.unidad)
C = 10 %Bs/unidad
Cp = h + i*C %Bs/(unidad.año)
r = Cp/C %Bs/(Bs.unidad.año)
Cp = Cp/52 %Bs/(unidad.semana)
r = Cp/C %Bs/(Bs.unidad.semana)
Co = 600 %Bs/orden

T = [1:0.05:10];%semana
CT = Co*(1./T) + Cp*(T*D)/2; %Bs/semana
plot(T,CT)
%axis([1,10,2000,16000]) 
grid

CTmin = min(CT) %Bs/semana

[CTmin,iCTmin] = min(CT) %Bs/semana
Topt = T(iCTmin) %semana
