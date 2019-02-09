clear all;

a = [19 4 5 2 3; -2 10 0 7 1; 3 4 16 8 3; 9 2 2 21 2; 8 4 5 2 16];
b = [3; 4; 6; 2; 8];
x = [0; 0; 0; 0; 0];
x0 = x;
n = 5;

a^(-1)*b

for k = 1:1:100
  for i = 1:1:n
    s = 0;
    
    for j = 1:1:(i-1)
      s = s + a(i,j)*x0(j);
    end
    
    for j = (i+1):1:n
      s = s + a(i,j)*x0(j);
    end
    
    x(i) = (b(i)-s)/a(i,i);
  end
    sum(abs(x-x0))
    x0 = x;
  
end

x