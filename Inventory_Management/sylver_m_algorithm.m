function ans = sylver_m_algorithm(Co,Cp,D)
  pkg load dataframe
  costosPROM = zeros(1,1);
  t = 1;
  i = 1;
  while t < length(D)
    costosACUM = Co;
    it = 0;
    costosACUM = costosACUM+it*Cp*D(t);
    costosPROM(i) = costosACUM/(it+1);
    while 1
      i = i + 1;
      it = it + 1;
      t = t + 1;
      if t == length(D) + 1
        break 
      endif
        costosACUM = costosACUM + it*Cp*D(t);
        costosPROM(i) = costosACUM/(it + 1);
      if costosPROM(i) > costosPROM(i - 1)
        break
      endif
    endwhile
    i = i + 1;
    it = it + 1;
  endwhile
  ans = costosPROM';
  dataframe(ans,"colnames",{"Average costs"})
end
