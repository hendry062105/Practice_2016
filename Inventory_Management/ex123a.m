IFt = 0;                                  %(kg) IFt
IIt = 4*1200;                                 %(kg) IIt  SUPOSICIÓN PARRADO PÁG #29, SITUACIÓN B PÁG 37                                 
%Dt    =  14;                                 %(kg) Dt  CANTIDADES QUE COMPRAN LOS CLIENTES
Dt = [1200 1200 1200 1200 1200 1200 1200 1200]             %SITUACIÓN E
%Dt = [14 5 14 7 14 4 9 14 11] ???
Qt = 4*1200;                                  %"VARIABLE DE DESICIÓN"
t = 1;                                   %(semana) EN CADA SEMANA SÓLO SE TOMA EN CUENTA EL TIEMPO EN QUE LA BODEGA ESTÁ ABIERTA, VENDIENDO EL RESTO DEL TIEMPO PARA NOSOSTROS ES COMO SI NO EXISTIERA
n = 2;                                   %(semana)
comp = 0;    
tPcomp = 0;
MAT = zeros(n,6);                          %t,invi,demand,invf,comp
nivelPcomp = 0;
TE = 1;                                           %(semana)

y = zeros(2*n,1);  
x = zeros(2*n,1);
                      
while t <= n;                                   %tiempo
  IFt = IIt - Dt(t);          %Dt(t)%SITUACIÓN E                  %caída del inventario por la demanda en el transcurso de una semana
  if IFt == nivelPcomp                              %si el inventario final llegó a 0 al final de la semana se debe comprar (1)
    comp = 1;
    precio_de_compra = 8500*54;
  else
    comp = 0;
    precio_de_compra = 0;
  endif
  MAT(t,:) = [t*Qt/Dt(t),Qt,Dt(t),0,comp,precio_de_compra];  
  IIt = IIt + Qt;       
  IIt = IFt;                              %el inventerio inicial del siguiente periodo es el inicial del anterior
  t = t + 1;          IFt = IIt - Dt(t);          %Dt(t)%SITUACIÓN E                  %caída del inventario por la demanda en el transcurso de una semana
  if IFt == nivelPcomp                              %si el inventario final llegó a 0 al final de la semana se debe comprar (1)
    comp = 1;
    precio_de_compra = 8500*54;
  else
    comp = 0;
    precio_de_compra = 0;
  endif
  MAT(t,:) = [t*Qt/Dt(t),Qt,Dt(t),0,comp,precio_de_compra];  
  IIt = IIt + Qt;       
  IIt = IFt;                              %el inventerio inicial del siguiente periodo es el inicial del anterior
  t = t + 1;                                       %transcurso del tiempo    
endwhile
MAT

y1 = MAT(:,1) - Qt./1200; %Qt/Dt(t)
y2 = MAT(:,1);
y3 = [y1 y2]

x1 = MAT(:,2);
x2 = MAT(:,4);
x3 = [x1,x2]

k = 1;
for i = 1:n 
  for j = 1:2
  y(k) = y3(i,j);
  x(k) = x3(i,j);
  k = k + 1;
  end
end

y;
x;

plot(y,x)
title("modelo grafico de inventario")
ylabel("unidades")
xlabel("semanas")
grid