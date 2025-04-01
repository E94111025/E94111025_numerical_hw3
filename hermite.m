function [A,Q] = hermite(x,f,fp)
    % Hermite 插值法
    n = length(x);
    z = zeros(2*n,1);   % 擴展節點
    Q = zeros(2*n,2*n); % Hermite 差商表

    for i = 1:n
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1,1) = f(i);
        Q(2*i,1) = f(i);
        Q(2*i,2) = fp(i);
        
        if i > 1  % **避免 i=1 時出錯**
            Q(2*i-1,2) = (Q(2*i-1,1) - Q(2*i-2,1)) / (z(2*i-1) - z(2*i-2));
        end
    end

    % 計算高階差商
    for j = 3:2*n
        for i = j:2*n
            denominator = z(i) - z(i-j+1);
            if abs(denominator) < eps
                error('數值不穩定：除以零錯誤');
            end
            Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / denominator;
        end
    end

    % 提取 Newton 插值係數
    A = diag(Q);
end
