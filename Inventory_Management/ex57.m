DR = [320,500] ;%unidad/año
D = 400 ;%unidad/año
Cp = 0.05;%Bs/unidad.año
Co = 50  ;%Bs/orden

Q = sqrt((2*Co*D)/Cp) %unidad
CRE = (Co*DR/Q) + Cp*Q/2 %Bs/año
CSE = sqrt(2*Co*Cp*DR) %Bs/año

k = [0.25:0.25:3] %CRE/CSE k = D/DR
a = 50*((k+1-2*(sqrt(k)))./sqrt(k))%(%)  %hay un error en P58
%   a = 50*((sqrt(k)-1).^2)./(sqrt(k))%(%)
  
plot(k,a)
      

      
      

