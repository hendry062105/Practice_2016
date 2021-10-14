function [Q,T,Tref,AT,Icb,ATmax,iATmax,TmaxAT] = plot_saving_period(T,D,tcambiodeprecio,t,it,C,CTmin,Cp,Co)
  Icb = T*D - D*tcambiodeprecio + T*D*(it - 1);
  Tref = max(t) + T;
  figure (3);
  T = [0:0.001:4];
  Q = T*D;
  A1 = (C(2) - C(1))*Q;
  A2 = CTmin*Q/D;
  CPQ = (Cp(1)/D)*(Q.*Icb+0.5*Q.^2);
  Co;
  AT = A1 + A2 - CPQ - Co;
  plot(T,AT,"g")
  [ATmax,iATmax] = max(AT);
  Q = Q(iATmax);
  TmaxAT = Q/D;
end