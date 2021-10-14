
D = [6000 3000]%unidad/mes
Co = [500 400]%Bs/orden
Cp = [3.0 3.5]%Bs/(unidad.mes)
a = [1.25 0.875]%m^2/unidad

A = zeros(1,1)
CT = zeros(1,1)


i = 1;
for w = [0:0.001:4]%Bs/(m^2.mes)
  Q = (2*Co.*D./(Cp+2*a.*(ones(size(a)))*w)).^0.5;%unidades
  A(i) = sum(Q.*a);%m^2
  CTm = Co.*D./Q + 0.5*Cp.*Q;
  CT(i) = sum(CTm);
  i = i + 1;
endfor


clf;
 w = [0:0.001:4];
 ax = plotyy (A,w, A,CT, @plot);
 title("area del almacen")
 xlabel ('A(m^2)');
 ylabel (ax(1), 'w(Bs/(m.mes))');
 ylabel (ax(2), 'CT(Bs)');
 

