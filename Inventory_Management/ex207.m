 
A = Cp.*D
H = (Co./A).^0.5
k = round(H./min(H))

Topt = (2*(CoAd + sum(Co./k))/sum(k.*A))^0.5
Copt=(2*(CoAd + sum(Co./k))*sum(k.*A))^0.5

k*Topt