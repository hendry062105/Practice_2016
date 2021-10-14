Co = 50%Bs/orden
Cp = 0.015%Bs/(unidad.semana) 
Ce = 9*Cp%Bs/(unidad.semana) %k = Ce/Cp = 9
D = 2000%unidades/semana

Q = linspace(3000,4000,200);
Imax = linspace(1,2000,200)*0;
[QQ,ImaxImax] = meshgrid(Q,Imax);
CT = (Co*D)./QQ + (Cp*((0.90*QQ).^2))./(2*QQ) + (Ce*((QQ-0.90*QQ).^2))./(2.*QQ);
meshc(QQ,ImaxImax,CT) 
xlabel("Q(unidades)")
ylabel("Imax(unidades)")
zlabel("CT(Bs)")

[minCT,iminCT] = min(min(CT));
[MinCT,jminCT] = min(CT);
minCT

iminCT
Qopt = Q(iminCT)
jminCT = jminCT(iminCT)
Imaxopt = Imax(jminCT)

Q = Qopt
Imax = 0.90*Q
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