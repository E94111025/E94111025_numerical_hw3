function test_hermite()
    format long; % 設定高精度顯示

    % 測試數據
    x = [0; 3; 5; 8; 13];
    f = [0; 225; 383; 623; 993];
    fp = [75; 77; 80; 74; 72];

    % 呼叫 Hermite 插值函數
    [A, Q] = hermite(x, f, fp);

    % 擴展的節點 (每個 x 出現兩次)
    z = repelem(x, 2);

    % 轉換為標準多項式形式
    C = newton_to_standard(A, z);

    % 顯示結果
    disp('Hermite 插值 Newton 差商係數:');
    disp(A);

    disp('Hermite 差商表:');
    disp(Q);

    disp('標準多項式的係數 (從最高次到常數項):');
    disp(C);
end
