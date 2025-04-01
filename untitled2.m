function [p, Q] = untitled2(x0, x, f)
    n = length(x);
    Q = zeros(n, n); % 初始化 Q 矩陣
    Q(:,1) = f; % 設定第一列為函數值
    x = [-0.440818; -0.270320; -0.106531; 0.0511884];
    f = [0.3; 0.4; 0.5; 0.6];

    [p, Q] = neville(0, x, f);

    for j = 2:n
        for i = j:n
            denominator = x(i-j+1) - x(i);
            if abs(denominator) < eps % 避免除以零
                error('除以零錯誤：x(i-j+1) 和 x(i) 太接近');
            end
            Q(i,j) = ((x0 - x(i)) * Q(i-1,j-1) - (x0 - x(i-j+1)) * Q(i,j-1)) ...
                     / denominator;
        end
    end
    
    p = Q(n, n); % 取最右上角的值作為插值結果
end
