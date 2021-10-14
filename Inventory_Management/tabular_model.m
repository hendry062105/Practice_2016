function ans = tabular_model(invf,invi,demand,Qt,t,n)
  pkg load dataframe
  comp = 0; %"si" or "no"
  MAT = zeros(n,5);%t,invi,demand,invf,comp     
  while t <= n;%tiempo
        if invi == 0;%si inventario inicial = 0 entonces inventario inicial = 1200; "RATA DE SUMINISTRO INFINITA"
          invi = Qt;                     
        end                     
        invf = invi - demand;%caída del inventario por la demanda en el transcurso de una semana
        if invf == 0 %si el inventario final llegó a 0 al final de la semana se debe comprar (1)
          comp = 1;
        else
          comp = 0;
        endif
        MAT(t,:) = [t,invi,demand,invf,comp];  
        invi = invf;%el inventerio inicial del siguiente periodo es el inicial del anterior
  t = t + 1;%transcurso del tiempo    
  end
  ans = dataframe(MAT,"colnames", {"t", "I_Stock", "Demand","F_Stock","Buy"});
endfunction