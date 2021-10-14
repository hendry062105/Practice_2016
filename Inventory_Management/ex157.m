D = 9000 %u/año
%h  = 0.70/52 %Bs/(unidad.semana)
%i  = 0.19/52 %Bs/(Bs.semana)
C = [1.25,1.80]; %Bs/unidad
%Cp = h + i*C %Bs/(unidad.semana)
r = 0.20%Bs/(Bs.unidad.año)
Cp = r*C%Bs/(unidad.año)
Co = 125 %Bs/orden
colors  ={"b";"r"};

%GRÁFICA
[T,TOPT CTmin] = plots_cost_period(D,C,Cp,r,Co,colors);

tcambiodeprecio = 5/12
T = TOPT(1)
t = 0;
it = 1;
[Q,T,Tref,AT,Icb,ATmax,iATmax,TmaxAT] = plot_saving_period(T,D,tcambiodeprecio,t,it,C,CTmin,Cp,Co);

%ÁNALISIS DE SENSIBILIDAD 
percent = 0.06
sensitivity_analisys(AT,T,iATmax,ATmax,percent);

%Q=1670%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DECISIÓN

s_policy_before_after_change(T,Tref,D,tcambiodeprecio,C,CTmin,Cp,Co,TOPT,Q,Icb);
clear all 

 
 