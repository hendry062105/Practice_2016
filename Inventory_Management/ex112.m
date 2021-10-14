clc;clear all

IFt  =  0;                                  %(kg) IFt
IIt =  56;%AyC 70 A 56                             %(kg) IIt  SUPOSICIÓN PARRADO PÁG #29, SITUACIÓN B PÁG 37                                 
%Dt    =  14;                                 %(kg) Dt  CANTIDADES QUE COMPRAN LOS CLIENTES
Dt = [14 14 14 14 14 14 14 14 14];%A           %SITUACIÓN E
Dt = [12 11 11 11 11 28 14 14 14]%AyE     %???
Qt =  56;                                  %"VARIABLE DE DESICIÓN" ó T
t =  1;                                   %(semana) EN CADA SEMANA SÓLO SE TOMA EN CUENTA EL TIEMPO EN QUE LA BODEGA ESTÁ ABIERTA, VENDIENDO EL RESTO DEL TIEMPO PARA NOSOSTROS ES COMO SI NO EXISTIERA
n =  9;                                   %(semana)
comp =  0;    
                               %"si" or "no"
tPcomp = 0;
                               
MAT   =  zeros(n,6);                          %t,invi,demand,invf,comp
nivelPcomp = 0;%B 14 A 0
TE = 0;%ByC 1 A 0                                          %(semana)


MAT = v_d_tabular_model(IFt,IIt,Dt,Qt,t,n,nivelPcomp,TE,tPcomp);
v_d_plot(MAT,n)

