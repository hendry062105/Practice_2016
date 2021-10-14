D = [6000 3000]%unidad/mes
Co = [500 400]%Bs/orden
Cp = [3.0 3.5]%Bs/(unidad.mes)
a = [1.25 0.875]%m^2/unidad
w = 0%Bs/(m^2.mes)
Q = (2*Co.*D./(Cp+2*a.*(ones(size(a)))*w)).^0.5%unidades
A0 = sum(Q.*a)%m^2
A = 0;
adivinando = 1
w = adivinando;

areaDelAlmacen = 2000;
while not(A == 2000)
  Q = (2*Co.*D./(Cp+2*a.*(ones(size(a)))*w)).^0.5;%unidades
  A = sum(Q.*a);%m^2;
  w = (areaDelAlmacen-A0)/(-A0 + A)*(adivinando-0);
  adivinando = w;
end

Q
CTm = Co.*D./Q + 0.5*Cp.*Q
CT = sum(CTm)
