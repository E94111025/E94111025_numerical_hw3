syms t;  % 定義符號變數 t

P = -0.00002022*t^9 + 0.00104059*t^8 - 0.02187567*t^7 + 0.24304125*t^6 - 1.53829560*t^5 + 5.50812051*t^4 - 10.09530894*t^3 + 7.16190804*t^2 + 75.00000000*t;

P_prime = diff(P, t);

P_double_prime = diff(P_prime, t);

% 將結果轉換為小數形式
P_prime_decimal = vpa(P_prime, 6);  % 保留6位小數
P_double_prime_decimal = vpa(P_double_prime, 6);  % 保留6位小數

% 顯示小數形式的導數
disp(P_prime_decimal);
disp(P_double_prime_decimal);

solutions_double_prime = vpasolve(P_double_prime, t);

% 顯示數值解
disp('Numerical solutions for P''(t) = 0:');
disp(solutions_double_prime);

P_prime_values = subs(P_prime, t, solutions_double_prime);

% 顯示帶回來的值
disp('The values of P''(t) at the solutions:');
disp(P_prime_values);
