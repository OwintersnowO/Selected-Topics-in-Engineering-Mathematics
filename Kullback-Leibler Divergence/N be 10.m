%settings
N = 10 ;

%brute force
D_min = 2147483647;
sigma = 0;
P_X = 1/(2*N+1);
for i = 0.01:0.01:1
    D = 0;
    for j = -N:N
        P_Y = tanh(i/2)*exp(-i*abs(j));
        L = log(P_X/P_Y);
        D = D + P_X*L;
    end
    if D < D_min
        D_min = D;
        sigma = i;
    end
end
disp(sigma);