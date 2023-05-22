%settings
n = 13;
k = 6;
p = ones(k,n) ;
g = zeros(k,n);
phi = zeros(k,n) ;

%calculate b_k[n], i for k, j for n
for i=1:k
    for j=1:n
        p(i,j) = prod([(j-i):(j-1)]);
    end
end

%calculate phi_k[n], i for k, j for n
phi(1,1:n) = p(1,1:n)/sqrt(sum(exp([-1:-1:-n]).*p(1,1:n).*p(1,1:n)));
for i=2:k
    g(i,1:n) = p(i,1:n) - sum(exp([-1:-1:-n]).*p(i,1:n).*phi(1:i,1:n).*phi(1:i,1:n));
    phi(i,1:n) = g(i,1:n)/sqrt(sum(exp([-1:-1:-n]).*g(i,1:n).*g(i,1:n)));
end