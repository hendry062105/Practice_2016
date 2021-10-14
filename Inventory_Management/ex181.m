clf;
k = 0:0.01:1;
CTkCT0 = (1 - k).^0.5;
fracDEocio = 1 - k;
ax = plotyy (k,CTkCT0, k,fracDEocio, @plot); %@semilogy);
xlabel ('k');
ylabel (ax(1), 'CTkCT0');
ylabel (ax(2), 'fracDEocio');