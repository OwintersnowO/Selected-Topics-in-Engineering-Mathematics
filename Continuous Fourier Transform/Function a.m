%settings
dx = 0.05 ;
T = 2 ;
N = T/dx + 1 ;
fs = 1/dx ;
df = 1/(N*dx) ;
j = sqrt(-1) ;

%Sampling
n_s = 0:dx:T ;
g_d = 4-n_s.^2 ;

%DFT
Gd = zeros(1,N) ;
for m = 0:(N-1)
	for n = 0:(N-1)
		Gd(m+1) = Gd(m+1) + g_d(n+1)*exp(-j*2*pi*m*n/N) ;
	end
end

%Mapping to the true frequency
f_s_neg = [ceil(N/2):(N-1)]*fs/N-fs ;
f_s_pos = [0:N/2]*fs/N ;
f_s = [f_s_neg f_s_pos] ;
G = fftshift(Gd*dx) ;

%Plotting the graph
figure
hold on
plot(f_s, real(G));
plot(f_s, imag(G));
hold off