function [T,TOPT CTmin] = plots_cost_period(D,C,Cp,r,Co,colors)
 TOPT = [0 0]
 it = 1;
  while it <= 2
    T = [0.5:0.001:20];%semana
    T = [0.5:0.001:20];%semana
    CT = Co*(1./T) + (r*C(it))*(T*D)/2;%Bs/semana
    figure (1);
    plot(T,CT,colors{it})
    %axis([1,10,2000,16000]) 
    hold on
    grid
    [CTmin,iCTmin] = min(CT); %Bs/semana
    Topt = T(iCTmin); %semana
    TOPT(1,it) = Topt;
    it = it + 1;
  endwhile 
end
