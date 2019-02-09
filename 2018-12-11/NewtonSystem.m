clear all;

f1 = @(x, y, z) x^2 + y^2 - z;
f2 = @(x, y, z) x^2 + y^2 - z^2;
f3 = @(x, y, z) log(x) - sqrt(y) + 0.8;

F = @(x, y, z) ...
    [2*x  2*y          -1;
     2*x  2*y          -2*z;
     1/x -1/(2*sqrt(y)) 0];

% F(0, 0, 0)

X = [1 1 1]';
X0 = X;

for i=1:1:10
    X = X0 - F(X0(1), X0(2), X0(3)) ^ (-1) * ...
        [f1(X0(1), X0(2), X0(3));
         f2(X0(1), X0(2), X0(3));
         f3(X0(1), X0(2), X0(3))];
    
    max(abs(X - X0))
    X0 = X;
end

X