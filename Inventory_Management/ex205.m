D = [200 1500 2000]
P = [3000 4000 5000]
Co = [500 500 500]
Cp = [2.0 1.6 1.5]

A = Cp.*D.*(1 - D./P)
H = (Co./A).^0.5
k = round(H./min(H))

Topt = (2*sum(Co./k)/sum(k.*A))^0.5
Copt = (2*sum(Co./k)*sum(k.*A))^0.5

k*Topt

ToptINTERFERENCIA = (2*Co./(Cp.*D.*(1 - D./P))).^0.5
CoptINTERFERENCIA = (2*Co.*(Cp.*D.*(1 - D./P))).^0.5
sum(CoptINTERFERENCIA)
