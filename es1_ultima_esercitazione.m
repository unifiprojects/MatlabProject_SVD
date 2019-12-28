clc
clear

A1 = [1 1 1 1 
      8 4 2 1
      27 9 3 1
      64 16 4 1
      8 4 2 1
      -1 0 0 0];

A2 = [1 1 1
      1 2 3
      1 3 6
      1 4 10
      1 4 10
      1 4 10];

b = [-2; 0; 0; 0; 1; 0];

x1 = minimi_quad_svd(A1, b)
x2 = minimi_quad_svd(A2, b)

controprova1 = A1*x1-b
controprova2 = A2*x2-b
