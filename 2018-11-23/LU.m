clear all;

n = 4;

a = [-11 0 0 0; -15 -2 0 0; 0 8 -15 4; 0 0 3 6];
u = eye(n);
l = eye(n);

for i = 1:1:n
  for j = 1:1:(i-1)
    s = 0;
    for k = 1:1:(j-1)
      s = s + l(i,k) * u(k,j);
    end
    l(i,j) = (a(i,j) - s)/u(j,j);
  end
  for j = i:1:n
    s = 0;
    for k = 1:1:(i-1)
      s = s + l(i,k) * u(k,j);
    end
    u(i,j) = (a(i,j) - s);
  end
end
