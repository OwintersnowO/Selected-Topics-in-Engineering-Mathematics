%settings
dx = 0.1 ;
T = 4 ;
N = T/dx + 1 ;
fs = 1/dx ;
df = 1/(N*dx) ;
j = sqrt(-1) ;

%Shifting: g1(x)=g(x-2)

%Sampling
n_s = 0:dx:T ;
g_d = sin(pi*(n_s-2).^2)./(pi*(n_s-2).^2) ;
g_d(21) = 1;

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
G1 = fftshift(Gd*dx) ;

%Using the modulation property
G = exp(j*4*pi*f_s).*G1 ;

%Plotting the graph
figure
hold on
plot(f_s, real(G));
plot(f_s, imag(G));
hold off