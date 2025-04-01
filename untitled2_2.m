numerator = [1, -3]; % 分子: s - 3

% 分母:
temp1 = conv([1, 0], [1, 1]); % s * (s + 1)
denominator = conv(temp1, [1, 0.1, 5]); % (s^2 + 0.1s + 5)

G = tf(numerator, denominator);

figure; 
bode(G); 
grid on; 