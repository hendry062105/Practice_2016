D = [6000 3000]%unidad/mes
Co = [500 400]%Bs/orden
Cp = [3.0 3.5]%Bs/(unidad.mes)
a = [1.25 0.875]%m^2/unidad
w = [0:0.001:1];%Bs/(m^2.mes)

Q1 = zeros(1,1)
Q2 = zeros(1,1)
A  = zeros(1,1)

i = 1;
for w = [0:0.001:2]
  Q1(i) = (2*Co(1).*D(1)./(Cp(1)+2*a(1).*(w))).^0.5;%unidades
  Q2(i) = (2*Co(2).*D(2)./(Cp(2)+2*a(2).*(w))).^0.5;%unidades
  Q = [Q1(i) Q2(i)];
  A(i) = sum(Q.*a);%m^2
  i = i + 1;
end

plot(A,Q1,"b",A,Q2,"r")
title("tamaño de los lotes vs. área")
xlabel("A(m^2)")
ylabel("Q(unidades)")

