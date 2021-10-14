D12 = [6000 3000]%unidad/mes
Co = [500 400]%Bs/orden
Cp = [3.0 3.5]%Bs/(unidad.mes)
a = [1.25 0.875]%m^2/unidad
w = 0%Bs/(m^2.mes)
Q = (2*Co.*D12./(Cp+2*a.*(ones(size(a)))*w)).^0.5%unidades
A = sum(Q.*a)%m^2

adivinando = 1
w = adivinando;
while not(A == 2000)
  Q = (2*Co.*D12./(Cp + 2*a.*(ones(size(a)))*w)).^0.5;%unidades
  A = sum(Q.*a);%m^2;
  w = (2000 - 2492.33)/(-2492.33 + A)*(adivinando - 0);
  adivinando = w;
end


CTm = Co.*D12./Q + 0.5*Cp.*Q
CT = sum(CTm)

A = Q.*a%m^2

II = zeros(1,1);
II2 = zeros(1,1);


for i = [1:1:2]
  k = 1;
  D = D12(i)
  t = 0
  it = 0
  l = 1
  while it <= 3%max(t)<tcambiodeprecio && tcambiodeprecio <max(t)+T %it<=1
    T = (Q(i))/D;
    %figure (i);
    hold on
    t = [T*it:0.001:T*(it + 1)];
    I = (T*D - D*t + T*D*it)*a(i);
    if i == 1
      for k = [1:1:length(I)]
        II(l) = I(k);
        l = l + 1;
      endfor
    end
    if i == 2
      for k=[1:1:length(I)]
        II2(l) = I(k);
        l = l + 1;
      endfor
    end
    I = [0:1:T*D*a(i)];
    #t = zeros(1,T*D*a(i)+1) + it*T;
    %plot(t,I)
    grid
    max(t);
    max(t) + T;  
    it = it + 1;
  endwhile
endfor

t = linspace(0,0.92,length(II2));

length(II)
length(II2)

II = [II, zeros(1,length(II2)-length(II))];

plot(t,II + II2)
title ("uso del espacio almacen")
xlabel("t(mes)")
ylabel("A(m^2)")


