function [Differential_operator] = function_F(y)
y(1) = 0;
y(2) = 1;

Differential_operator(1) = y(2);
Differential_operator(2) = -y(1);
end
