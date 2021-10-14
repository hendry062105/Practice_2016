Dm = [100 1000 1000]
Co = [1000 800 600]
CoAd = 1000
Cp = [3.0 2.6 2.0]

A = Cp.*Dm
H = (Co./A).^0.5
k = round(H./min(H))

Topt = (2*(CoAd+sum(Co./k))/sum(k.*A))^0.5
Copt = (2*(CoAd+sum(Co./k))*sum(k.*A))^0.5

k*Topt

for i = [1:1:3]
  t = 0
  it = 0
  D = Dm(i)
  while it <= 3%max(t)<tcambiodeprecio && tcambiodeprecio <max(t)+T %it<=1
    T = k(i)*Topt
    figure (i);
    hold on
    t = [T*it:0.001:T*(it+1)];
    I = T*D-D*t+T*D*it;
    plot(t,I)
    I = [0:1:T*D];
    t = zeros(1,T*D+1)+it*T;
    plot(t,I)
    grid
    max(t)
    max(t) + T  
    it = it + 1;
  endwhile
endfor