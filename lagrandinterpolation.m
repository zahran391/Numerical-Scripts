clear; clc;

% النقط المعطاة (X و Y)
x_vals = [1, 2, 3];
y_vals = [3, 2.5, 1];

% النقطة أو القيمة اللي عاوز تحسب عندها الاستقراء
x_target = 2.5;

n = length(x_vals);
L = zeros(1, n);
y_target = 0;

% حساب متعددة حدود لانغرانج
for i = 1:n
    L(i) = 1;
    for j = 1:n
        if j ~= i
            L(i) = L(i) * (x_target - x_vals(j)) / (x_vals(i) - x_vals(j));
        end
    end
    y_target = y_target + y_vals(i) * L(i);
end

fprintf('Lagrange Interpolation value at x = %.2f is: %.4f\n', x_target, y_target);
