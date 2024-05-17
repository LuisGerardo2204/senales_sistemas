clear
clc
close all

w=[0:0.01:3500];

k=0*ones(size(w));
G=8.7;

fact1=-2*G*(log(w/10)).*(w>=10);
fase1=-39*(log(w/1)).*(w>=1)+39*(log(w/10)).*(w>=10);

fact2=1*G*(log(w/300).*(w>=300));
fact3=2*G*(log(w/5).*(w>=5));
fact4=-2*G*(log(w/40).*(w>=40));

semilogx(w,k+fact1+fact2+fact3+fact4)
grid
figure
semilogx(w,fase1)
grid

%plot(w,k+fact1+fact2+fact3)