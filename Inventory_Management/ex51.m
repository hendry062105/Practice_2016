D = 14   ; %tons/semana
h = 2*85; %Bs/(unidad.año)
i = 0.22; %Bs/(Bs.unidad)
C = 8500; %Bs/unidad
Cp = h + i*C; %Bs/(unidad.año)
Cp = Cp/52; %Bs/(unidad.semana)
r = Cp/C;
Co = 15000; %Bs/orden
T = [4:0.5:10]';
m = length(T);

N = 1./T; %orden/semana
Q = T*D; %unidads
%Imax = max(T*D)*ones(m,1); %unidades
Imax = Q;
Imin = 0; %= min(T*D)*ones(4,1) %unidades
Im = Im = (Imax + Imin)/2; %unidades

CO = Co*(1./T);  %Bs/semana
CP = Cp*(T*D)/2; %Bs/semana
CT = CO + CP;    %Bs/semana

CO = CO*52; %Bs/año
CP = CP*52; %Bs/año
CT = CT*52; %Bs/año
     
MAT = [T,N,Q,Imax,Im,CO,CP,CT]

plot(T,CT,T,CO,T,CP,"r")

min(CT) %Bs/año

Topt = sqrt(2*Co/(Cp*D)) %semana
%Qopt = Topt*D %unidades

[CTmin, iCTmin] = min(CT)
Tmin = T(iCTmin)

