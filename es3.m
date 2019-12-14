% Es3 dell'esercitazione IV:

A = [2 3 5 7
    3 3 14 2
    4 12 7 19
    12 4 3 11
    12 4 3 78]

[U, V, sigma] = aat_svd(A);
checkAAT = U*sigma*V'

[U, V, sigma] = ata_svd(A);
checkATA = U*sigma*V'

[Umatlab,Smatlab,Vmatlab] = svd(A);
checkSVD = Umatlab*Smatlab*Vmatlab'

