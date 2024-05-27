clear
clc

num=[5 -5];
den=conv(conv([1 1],[1 2]),conv([1 -2],[1 -3]));
 G=tf(num,den)
[r,p,k]=residue(num,den)