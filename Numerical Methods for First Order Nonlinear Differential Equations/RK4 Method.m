h = 0.025 ;
n = 10/h+1 ;
x = zeros(n,1) ;
y = zeros(n,1) ;
x(1) = 0;
y(1) = 2;
for i = 1:n-1
    x(i+1) = x(i)+h ;
    k1 = sqrt(x(i)*y(i))*cos(x(i)*y(i)) ;
    k2 = sqrt((x(i)+h/2)*(y(i)+h*k1/2))*cos((x(i)+h/2)*(y(i)+h*k1/2)) ;
    k3 = sqrt((x(i)+h/2)*(y(i)+h*k2/2))*cos((x(i)+h/2)*(y(i)+h*k2/2)) ;
    k4 = sqrt((x(i)+h)*(y(i)+h*k3))*cos((x(i)+h)*(y(i)+h*k3)) ;
    y(i+1) = y(i)+(k1+2*k2+2*k3+k4)*h/6 ;
end
plot(x,y);