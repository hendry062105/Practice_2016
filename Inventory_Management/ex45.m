%unidad = tons
%T = 3semanas
D = 14 %tons/semana

h = 2*85 %Bs/(unidad.año)
i = 0.22 %Bs/(Bs.unidad)
C = 8500 %Bs/unidad
Cp = h + i*C %Bs/(unidad.año)
Cp = Cp/52 %Bs/(unidad.semana)
r = Cp/C
Co = 15000 %Bs/orden

%GRÁFICA
T = [1:0.1:20];%semana
CT = Co*(1./T) + Cp*(T*D)/2;%BS/semana
plot(T,CT)
%axis([1,10,2000,16000]) 
grid

[CTmin,iCTmin] = min(CT) %Bs/semana
Topt = T(iCTmin) %semana
    
%RESPUESTAS b P114
T = 4 %semanas
CO = Co*(1./T);  %Bs/semana
CP = Cp*(T*D)/2; %Bs/semana
CT = CO + CP;    %Bs/semana

CO = CO*52 %Bs/año
CP = CP*52 %Bs/año
CT = CT*52 %Bs/año