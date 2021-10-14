function sensitivity_analisys(AT,T,iATmax,ATmax,percent)
  i = iATmax
  while AT(i) >= ATmax - percent*ATmax
    i = i + 1;
  endwhile
  i_der = i
  T6porcDER = T(i_der)
  i = iATmax
  while AT(i) >= ATmax-percent*ATmax
    i = i - 1;
  endwhile
  i_izq = i
  T6porcIZQ = T(i_izq)
end