D = [6000 3000]%unidad/mes
Co = [500 400]%Bs/orden
Cp = [3.0 3.5]%Bs/(unidad.mes)

Q = [1106 705]
Q1 = linspace(1000,2000,40);
Q2 = linspace(250,3000,40);
Q = [Q1; Q2];
[Q1Q1,Q2Q2]=meshgrid(Q1,Q2);
CT = (Co(1).*D(1)./Q1Q1 + 0.5*Cp(1).*Q1Q1) + (Co(2).*D(2)./Q2Q2 + 0.5*Cp(2).*Q2Q2);
meshc(Q1Q1,Q2Q2,CT) 
xlabel("Q1(unidades)")
ylabel("Q2(unidades)")
zlabel("CT(Bs)")

min(min(CT))
