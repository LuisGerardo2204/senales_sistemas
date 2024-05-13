clear
clc
close all

w=[0:0.01:1500];

k=0*ones(size(w));
G=8.8;

fact1=-2*G*(log(w/10)).*(w>=10);

fact2=1*G*(log(w/300).*(w>=300));
fact3=-0*(w-5).*(w>=5);
fact4=-0*(w-40).*(w>=40);

semilogx(w,k+fact1+fact2+fact3+fact4)
grid

%plot(w,k+fact1+fact2+fact3)