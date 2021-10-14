function v_d_plot(MAT,n)
  y = zeros(2*n,1);  
  x = zeros(2*n,1);
  y1 = MAT(:,1)-1;
  y2 = MAT(:,1);
  y3 = [y1 y2];
  x1 = MAT(:,2);
  x2 = MAT(:,4);
  x3 = [x1,x2];
  k = 1;
  for i = 1:n 
    for j = 1:2
    y(k) = y3(i,j);
    x(k) = x3(i,j);
    k = k + 1;
    end
  end
  plot(y,x)
  grid
end
