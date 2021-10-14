D = 400 %tons/semana

h  = 0.70/52 %Bs/(unidad.semana)
i  = 0.19/52 %Bs/(Bs.semana)
C  = [10,12]; %Bs/unidad
Cp = h + i*C %Bs/(unidad.semana)
Co = 50 %Bs/orden
colors={"b";"r"};

TOPT = [0 0]

%GRÁFICA
it = 1;
while it <= 2
    T = [0.5:0.01:20];%semana
    T = [0.5:0.01:20];%semana
    CT = Co*(1./T) + (h + i*C(it))*(T*D)/2;%Bs/semana
    figure (1);
    plot(T,CT,colors{it})
    %axis([1,10,2000,16000]) 
    hold on
    grid
    [CTmin,iCTmin] = min(CT); %Bs/semana
    Topt = T(iCTmin) %semana
    TOPT(1,it) = Topt
it = it + 1;
endwhile

tcambiodeprecio = 4
t = 0
it = 0
T = TOPT(1)
while not(max(t) < tcambiodeprecio && tcambiodeprecio < max(t)+T) %it<=1
T=TOPT(1)
figure (2);
hold on
  t = [T*it:0.001:T*(it+1)];
  I = T*D-D*t+T*D*it;
  plot(t,I)
  I = [0:1:T*D];
  t = zeros(1,T*D+1)+it*T;
  plot(t,I)
  grid
  max(t)
  max(t)+T
it = it + 1;
endwhile

Icb = T*D - D*tcambiodeprecio+T*D*(it-1)
Tref = max(t) + T
figure (3);
%Q=0:0.01:17000;
T = [0:0.01:50];
Q = T*D;
A1 = (C(2) - C(1))*Q;
A2 = CTmin*Q/D;
CPQ = (Cp(1)/D)*(Q*Icb+0.5*Q.^2);
Co = 50;
AT = A1 + A2 - CPQ - Co;
plot(T,AT,"g")

[ATmax,iATmax]=max(AT)
Q = Q(iATmax)

%Q=1670%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DESICIÓN

figure (2);
hold on
t=[tcambiodeprecio:0.001:(Q+Icb)/D+tcambiodeprecio];
I = Q + Icb - D*t+tcambiodeprecio*D;
plot(t,I,"g")
I = [Icb:1:Icb+Q];
t = zeros(1,Q + 1) + tcambiodeprecio;
plot(t,I,"g")
grid
  
it = 0;

T = TOPT(2);

do 
  T = TOPT(2);
  figure (2);
  hold on
  t = [Tref + T*it:0.001:Tref + T*(it + 1)];
  I = T*D - D*t + Tref*D + T*D*it;
  plot(t,I,"r")
  I = [0:1:T*D];
  t = zeros(1,T*D + 1) + it*T + Tref;
  plot(t,I,"r")
  grid
  it = it + 1;
until Tref + T*(it + 1)>(Q + Icb)/D + tcambiodeprecio
grid

t = [Tref + T*it:0.001:Tref + T*(it + 1)];
I = T*D-D*t + Tref*D + T*D*it;
plot(t,I,"r")
I = [0:1:T*D];
t = zeros(1,T*D + 1) + it*T + Tref;
plot(t,I,"r")
grid

