clear
clc
close all

w=[0:0.01:3500];
num=[1/300 1 0];
den=conv([1/5 1],[1/40 1]);
G=tf(num,den)

 [mag,phase,wout]=bode(G,w);

k=0*ones(size(w));
G=8.7;

fact1=1*G*log(w);
fase1=-39*(log(w/1)).*(w>=1)+39*(log(w/10)).*(w>=10);

fact2=1*G*(log(w/300).*(w>=300));
fact3=-1*G*(log(w/5).*(w>=5));
fact4=-1*G*(log(w/40).*(w>=40));

semilogx(w,k+fact1+fact2+fact3+fact4)
hold on
amp=[];
for i=1:1:max(size(mag))
amp(i)=mag(1,1,i);
end    

plot(wout,8.7*log(amp)) 
grid
figure
semilogx(w,fase1)
grid

%plot(w,k+fact1+fact2+fact3)