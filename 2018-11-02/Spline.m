clear all;

n = 6;
dx = 1;
x = [1 2 3 4 5 6];
% y = [10 12 13 13 4 6];
y = [4 7 7 6 2 4];

b(1 : 1 : (3*(n-1))) = 0;
a(1 : 1 : (3*(n-1)), 1 : 1 : (3*(n-1))) = 0;

% заполняем вектор b
b(1) = y(1);

for i = 1 : 1 : (n-2)
  b(2*i) = y(i+1);
  b(2*i+1) = y(i+1);
end

b(2*(n-1)) = y(n);


% заполняем матрицу a
for i = 1 : 1 : (n-1)
  a(2*(i-1) + 1, (3*(i-1) + 1)) = 1;
  a(2*(i-1) + 2, (3*(i-1) + 1) : 1 : (3*i)) = [1 dx dx^2];
end

for i = 1 : 1 : (n-2)
  a((2*(n-1) + i), ((3*(i-1) + 1) : 1 : (3*(i-1) + 6))) = [0 1 2*dx 0 -1 0];
end

a(3*(n-1), 2) = 1;

% находим вектор решения (x)
S = a^(-1) * b';

ddx = 0.01;
iii = 0;

for np = 1 : 1 : (n-1)
  a0 = S( 3*(np-1) + 1 );
  a1 = S( 3*(np-1) + 2 );
  a2 = S( 3*(np-1) + 3 );
   
  for xx = x(np) : ddx : x(np+1)
    iii = iii + 1;
    xxx(iii) = xx;
    yyy(iii) = a0 + a1*(xx-x(np)) + a2*(xx-x(np))^2;
  end
end

plot(x, y, 'o', xxx, yyy)