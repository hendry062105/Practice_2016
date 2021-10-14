invf = 0;                                  %(kg) IFt
invi = 4*1200;                               %(kg) IIt                                      
demand = 1200;                                %(kg) Dt  CANTIDADES QUE COMPRAN LOS CLIENTES
Qt = 4*1200
t = 1;                                  %(semana) EN CADA SEMANA SÓLO SE TOMA EN CUENTA EL TIEMPO EN QUE LA BODEGA ESTÁ ABIERTA, VENDIENDO EL RESTO DEL TIEMPO PARA NOSOSTROS ES COMO SI NO EXISTIERA
n = 8;                                  %(semana)
comp = 0;                                  %"si" or "no"
MAT = zeros(8,5);                         %t,invi,demand,invf,comp
                       
while t <= n;                                  %tiempo
  if invi == 0;                            %si inventario inicial = 0 entonces inventario inicial = 1200; "RATA DE SUMINISTRO INFINITA"
    invi = Qt;                     
  end                    
  invf = invi - demand;                      %caída del inventario por la demanda en el transcurso de una semana
  if invf == 0                             %si el inventario final llegó a 0 al final de la semana se debe comprar (1)
    comp = 1;
  else
    comp = 0;
  endif
  MAT(t,:) = [t,invi,demand,invf,comp];  
  invi = invf;                            %el inventerio inicial del siguiente periodo es el inicial del anterior
  t = t + 1;                                       %transcurso del tiempo    
end
MAT