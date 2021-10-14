D = 1200   ; %tons/semana
h  = 2*85; %Bs/(unidad.año)
i  = 0.22; %Bs/(Bs.unidad)
C = 30; %Bs/unidad
r=0.005;
Cp = r*C; %Bs/(unidad.año)
Co = 2000; %Bs/orden
T=[1:0.01:15]';
m = length(T);

N = 1./T; %orden/semana
Q = T*D; %unidads
%Imax = max(T*D)*ones(m,1); %unidades
Imax = Q;
Imin = 0; %= min(T*D)*ones(4,1) %unidades
Im = Im = (Imax + Imin)/2; %unidades

CO  = Co*(1./T);  %Bs/semana
CP  = Cp*(T*D)/2; %Bs/semana
CT  = CO + CP;    %Bs/semana
     
MAT=[T,N,Q,Imax,Im,CO,CP,CT];

plot(T,CT,T,CO,T,CP,"r")

min(CT) %Bs/año
Topt = sqrt(2*Co/(Cp*D)) %semana
%Qopt = Topt*D %unidades
[CTmin, iCTmin] = min(CT)
Tmin = T(iCTmin)
Qopt=Tmin*D

