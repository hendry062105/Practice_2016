function  ans = v_d_tabular_model(IFt,IIt,Dt,Qt,t,n,nivelPcomp,TE,tPcomp)
  pkg load dataframe
  comp =  0; 
  MAT   =  zeros(n,6);    
  while t<=n;                                   %tiempo
        if IIt == nivelPcomp && TE!=0;        %***14***          %si inventario inicial = 0 entonces inventario inicial = 1200; "RATA DE SUMINISTRO INFINITA"
          tPcomp = t
        else if t == tPcomp+TE
          IIt = IIt + Qt;  
        else if IIt == nivelPcomp && TE == 0
          IIt = IIt + Qt;
        endif         
        endif
        endif
        IFt = IIt - Dt(t);          %Dt(t)%SITUACIÓN E                  %caída del inventario por la demanda en el transcurso de una semana
        if IFt == nivelPcomp                              %si el inventario final llegó a 0 al final de la semana se debe comprar (1)
          comp = 1;
          precio_de_compra=8500*54;
        else
          comp = 0;
          precio_de_compra = 0;
        endif
         MAT(t,:) = [t,IIt,Dt(t),IFt,comp,precio_de_compra];  
         IIt=IFt;                              %el inventerio inicial del siguiente periodo es el inicial del anterior
  t = t + 1;                                       %transcurso del tiempo    
  endwhile
  dataframe(MAT,"colnames", {"t", "I_Stock", "Demand","F_Stock","Buy","Quantity"})
  ans = MAT;
endfunction
