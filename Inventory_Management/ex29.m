#pkg load dataframe

invf = 0; %(kg) IFt
invi = 1200; %(kg) IIt                                      
demand = 400; %(kg) Dt  CANTIDADES QUE COMPRAN LOS CLIENTES
Qt = 1200;
t = 1; %(semana) EN CADA SEMANA SÓLO SE TOMA EN CUENTA EL TIEMPO EN QUE LA BODEGA ESTÁ ABIERTA, VENDIENDO EL RESTO DEL TIEMPO PARA NOSOSTROS ES COMO SI NO EXISTIERA
n = 7; %(semana)

tab = tabular_model(invf,invi,demand,Qt,t,n)        
          

