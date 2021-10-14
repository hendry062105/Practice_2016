D = [5000 1500 2000]%unidad/mes
Co = [500 500 400]%Bs/orden
Cp = [2.5 3.8 2.1]%Bs/(unidad.mes)
a = [3 1.5 2]%m^2/unidad
w = 0%Bs/(m^2.mes)
Q = (2*Co.*D./(Cp+2*a.*(ones(size(a)))*w)).^0.5%unidades
A0 = sum(Q.*a)%m^2
A = 0;
adivinando = 1
w = adivinando;

areaDelAlmacen = 5000;
while not(A == areaDelAlmacen)
  Q = (2*Co.*D./(Cp + 2*a.*(ones(size(a)))*w)).^0.5;%unidades
  A = sum(Q.*a)%m^2;
  w = (areaDelAlmacen - A0)/(-A0 + A)*(adivinando-0);
  adivinando = w;
end

Q
CTm = Co.*D./Q + 0.5*Cp.*Q
CT = sum(CTm)