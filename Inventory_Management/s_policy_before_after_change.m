function s_policy_before_after_change(T,Tref,D,tcambiodeprecio,C,CTmin,Cp,Co,TOPT,Q,Icb)
  t = 0
  it = 0
  figure (2);
  T = TOPT(1)
  while it <= 0 %max(t)<tcambiodeprecio && tcambiodeprecio <max(t)+T %it<=1
    hold on
    t = [T*it:0.001:T*(it + 1)];
    I = T*D - D*t+T*D*it;
    plot(t,I)
    I = [0:1:T*D];
    t = zeros(1,T*D + 1) + it*T;
    plot(t,I)
    grid
    max(t);
    max(t) + T;  
    it = it + 1;
  endwhile

  figure (2);
  hold on
  t = [tcambiodeprecio:0.001:(Q + Icb)/D + tcambiodeprecio];
  Icb
  "* * "
  I = Q + Icb  -D*t+tcambiodeprecio*D;
  
  plot(t,I,"g")
  I = [Icb:1:Icb + Q];
  t = zeros(1,Q + 1) + tcambiodeprecio;
  #plot(t,I,"g")
  plot([tcambiodeprecio,tcambiodeprecio],[Icb,Q + Icb],"g")
  grid
    
  it = 0;

  T = TOPT(2);

  do 
    T = TOPT(2);
    figure (2);
    hold on
    t = [Tref + T*it:0.001:Tref + T*(it+1)];
    I = T*D - D*t + Tref*D + T*D*it;
    plot(t,I,"r")
    I = [0:1:T*D];
    t = zeros(1,T*D + 1) + it*T + Tref;
    plot(t,I,"r")
    grid
    it = it + 1;
  until Tref + T*(it + 1) > (Q + Icb)/D + tcambiodeprecio
  grid

  t = [Tref + T*it:0.001:Tref + T*(it + 1)];
  I = T*D - D*t + Tref*D + T*D*it;
  plot(t,I,"r")
  I = [0:1:T*D];
  t = zeros(1,T*D + 1) + it*T + Tref;
  plot(t,I,"r")
  grid
end