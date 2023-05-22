h = 0.025 ;
n = 10/h+1 ;
x = zeros(n,1) ;
y = zeros(n,1) ;
x(1) = 0;
y(1) = 2;
for i = 1:n-1
    x(i+1) = x(i)+h ;
    y(i+1) = y(i)+sqrt(x(i)*y(i))*cos(x(i)*y(i))*h ;
end
plot(x,y);