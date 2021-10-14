Co = 50%Bs/orden
Cp = 0.015%Bs/(unidad.semana) 
%Ce = 5.164*Cp%Bs/(unidad.semana) %k = Ce/Cp = 5.164
D = 2000%unidades/semana

k = 5;
Imaxopt = 0
Qopt = 1


while (Imaxopt^2)/(2*Qopt) <= 1400%unidades
  Ce = k*Cp;
  Imopt = (Imaxopt^2)/(2*Qopt);
  Q = linspace(1,5000,400);
  Imax = linspace(1,4000,400);
  [QQ,ImaxImax] = meshgrid(Q,Imax);
  CT=(Co*D)./QQ + (Cp*(ImaxImax.^2))./(2*QQ) + (Ce*((QQ-ImaxImax).^2))./(2*QQ);
  [minCT,iminCT] = min(min(CT));
  [MinCT,jminCT] = min(CT);
  Qopt = Q(iminCT);
  jminCT = jminCT(iminCT);
  Imaxopt = Imax(jminCT);
  k = k + 0.001;
end

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
  I = -D*t + Imax+(T*D)*it;
  plot(t,I)
  it = it + 1;
endwhile
ylabel("I(unidades)")
xlabel("t(semanas)")
grid

k    
Imopt=(Imax^2)/(2*Q)