function C = newton_to_standard(A, z)
    % newton_to_standard 轉換 Newton 內插多項式為標準多項式形式
    % 輸入:
    %   A - Newton 內插的係數
    %   z - Newton 內插的節點 (已擴展, 每個 x 出現兩次)
    % 輸出:
    %   C - 標準多項式係數 (從最高次到常數項)

    n = length(A); % 多項式次數
    P = 1;  % 初始為常數 1
    C = A(1); 
    C = C(:)';  % 確保是行向量

    for i = 2:n
        % 生成 (t - z_i) 的展開
        P = conv(P, [1, -z(i-1)]);
        
        % **避免多算一次，確保 A(i) 乘上的是正確的 P**
        C = [zeros(1, length(P)-length(C)), C] + A(i) * P;
    end
end
