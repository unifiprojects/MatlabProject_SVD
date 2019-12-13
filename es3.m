% Es3 dell'esercitazione IV:

A = [2 3 5 7
    3 3 14 2
    4 12 7 19
    12 4 3 11
    12 4 3 78]

[U, V, sigma] = ata_svd(A);
[Umatlab,Smatlab,Vmatlab] = svd(A);

sigma
Smatlab
U
Umatlab
V
Vmatlab

A
checkA = U*sigma*V'
checkB = Umatlab*Smatlab*Vmatlab'
