color = {"g","r","b"};

D_ = [100 1000 1000]
P_ = [2500 2500 2500]
Co = [1000 800 600]
Cp = [3.0 2.6 2.0]

ToptINTERFERENCIA = (2*Co./(Cp.*D_.*(1-D_./P_))).^0.5
CoptINTERFERENCIA = (2*Co.*(Cp.*D_.*(1-D_./P_))).^0.5
sum(CoptINTERFERENCIA)

for i = [1:1:3]
  it = 0
  T = ToptINTERFERENCIA(i)
  P = P_(i)
  D = D_(i)
  while it<=3
    figure (i)
    T1=(D/P)*T;
    t = [T*it:0.01:T1+T*it];
    I = t*(P-D) - T*(P-D)*it;
    plot(t,I,color(i));hold on
    T2=(1-D/P)*T;
    Imax = (D/P)*T*(P-D);%unidades
    t = [T1+(T*it):0.01:T1+T2+(T*it)];
    I = -D*t + (Imax +(T1+(T*it))*D);
    plot(t,I,color(i))
    it=it+1;
  endwhile
endfor