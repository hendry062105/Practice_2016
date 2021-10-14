k = [0:0.0001:4]; %(Bs/semana)/(Bs/semana) k = T/T' 
%k=0.54054 %_______________________________________ 6a P61
a = (0.5*((1./k) + k) - 1)*100; % (%)
i = 1;
while a(i) > 6 %************************************ k para a = 6 %
  a(i);                         
i = i + 1;
end
i
k1 = k(i)
while a(i) < 6
  a(i);
i=i+1;
end
i
k2 = k(i)%************************************

plot(k,a)
axis([0,4,0,40]) 
title("analisis de sensibilidad")
xlabel("k")
ylabel("a%")
grid

D = 14%_____________________________________ 6b P61
Topt = 7.40  
Qopt = Topt*D
[k1*Topt,k2*Topt]
[k1*Qopt,k2*Qopt]

 