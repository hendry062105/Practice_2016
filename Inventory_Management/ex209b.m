color = {"g","r","b"};

Dm = [100 1000 1000]
Pm = [2500 2500 2500]
Co  =[1000 800 600]
Cp = [3.0 2.6 2.0]

A = Cp.*Dm.*(1-Dm./Pm)
H = (Co./A).^0.5
k = round(H./min(H))

Topt = (2*sum(Co./k)/sum(k.*A))^0.5
Copt = (2*sum(Co./k)*sum(k.*A))^0.5

k*Topt

for i=[1:1:3]
  it = 0
  T = k(i)*Topt
  P = Pm(i)
  D = Dm(i)
  while it<=3
    figure (i)
    T1 = (D/P)*T;
    t = [T*it:0.001:T1+T*it];
    I = t*(P - D) - T*(P - D)*it;
    plot(t,I,color(i));hold on
    T2 = (1 - D/P)*T;
    Imax = (D/P)*T*(P - D);%unidades
    t = [T1 + (T*it):0.01:T1 + T2 + (T*it)];
    I = -D*t + (Imax +(T1+(T*it))*D);
    plot(t,I,color(i))
    it = it + 1;
  endwhile
endfor