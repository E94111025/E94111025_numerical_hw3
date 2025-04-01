function [p, Q] = neville(x0, x, f)

    n = length(x);
    Q = zeros(n, n); 
    Q(:,1) = f; 
    
    for j = 2:n
        for i = j:n
            denominator = x(i-j+1) - x(i);
            Q(i,j) = ((x0 - x(i)) * Q(i-1,j-1) - (x0 - x(i-j+1)) * Q(i,j-1)) ...
                     / denominator;
        end
    end
    
    p = Q(n, n);
end
