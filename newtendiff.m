clear; clc;

% النقط المعطاة
x = [0; 1; 3; 4; 5];
y = [-16; -15; 65; 240; 609];

n = length(x);
coef = zeros(n, n);
coef(:, 1) = y;

% بناء جدول الفروق المقسومة (Divided Difference Table)
for j = 2:n
    for i = 1:(n-j+1)
        coef(i, j) = (coef(i+1, j-1) - coef(i, j-1)) / (x(i+j-1) - x(i));
    end
end

% طباعة معاملات كثيرة الحدود (Newton Polynomial Coefficients)
disp('Newton Divided Difference Table Coefficients:');
disp(coef(1, :));

% حساب القيمة عند نقطة معينة (مثلاً x = 3)
x_target = 4.5;
p = coef(1, 1);
term = 1;
for i = 1:n-1
    term = term * (x_target - x(i));
    p = p + coef(1, i+1) * term;
end

fprintf('Newton Interpolation value at x = %.2f is: %.4f\n', x_target, p);
