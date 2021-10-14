Co = 50%Bs/orden
Cp = 0.05%Bs/(unidad.semana)
Ce = 20*Cp%Bs/(unidad.semana) %k = Ce/Cp = 20
D = 400%unidades/semana

Q = linspace(500,2000,40);
Imax = linspace(500,2000,40);
[QQ,ImaxImax] = meshgrid(Q,Imax);
CT = (Co*D)./QQ + (Cp*(ImaxImax.^2))./(2*QQ) + (Ce*((QQ-ImaxImax).^2))./(2*QQ);
meshc(QQ,ImaxImax,CT) 
xlabel("Q(unidades)")
ylabel("Imax(unidades)")
zlabel("CT(Bs)")

%Co*D/QQ + (Cp*ImaQImaQ^2)/(2*QQ) + (Ce*(QQ-ImaQImaQ)^2)/(2*QQ)

[minCT,iminCT] = min(min(CT));
[MinCT,jminCT] = min(CT);
minCT

iminCT
Qopt = Q(iminCT)
jminCT = jminCT(iminCT)
Imaxopt = Imax(jminCT)

Q = Qopt
Imax = Imaxopt
T = Q/D

it = 0
while it <= 2
  figure (2)
  I = [-(Q-Imax):0.01:Imax];
  t = ones(1,length(I))*(T*it);
  plot(t,I)
  hold on
  t = T*(it):0.01:T*(it + 1);
  I = -D*t + Imax + (T*D)*it;
  plot(t,I)
it = it + 1;
endwhile
ylabel("I(unidades)")
xlabel("t(semanas)")
grid

