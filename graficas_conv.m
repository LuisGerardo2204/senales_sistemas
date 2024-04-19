clear
close all
clc
dt=0.0001;

t=[-0.3:dt:0.5];
%ht= @(x) exp(-x).*((x>=0)-(x>=2));
ht=@(x) (x>=0).*(261.7287*sin(239.58*x)).*exp(-52.98*x);
pt= @(x) ((x>=0)&(x<0.1))-((x>=0.1)&(x<0.2));


figure
subplot(1,2,1)
plot(t,ht(t))
xlabel("t")
ylabel("h(t)")
title("h(t)")
set(gca,'fontsize',10);
grid

subplot(1,2,2)
plot(t,pt(t))
xlabel("t")
ylabel("x(t)")
title("x(t)")
set(gca,'fontsize',10);
grid

figure

subplot(3,1,1)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,2)
plot(-t,ht(t-0.2))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid


subplot(3,1,3)
plot(-t,ht(t-0.05).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,1)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,2)
plot(-t,ht(t+0.15))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,3)
plot(-t,ht(t+0.15).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid

figure

subplot(3,1,1)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,2)
plot(-t,ht(t+0.25))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid


subplot(3,1,3)
plot(-t,ht(t+0.25).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid

figure

subplot(3,1,1)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,2)
plot(-t,ht(t+0.35))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,1,3)
plot(-t,ht(t+0.35).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid

figure
t=[-3:dt:5];
yt=(1-exp(-t)).*((t>0)&(t<=1))+...
    +(-1+4.4366*exp(-t)).*((t>1)&(t<=2))+(-0.1353-1.9525*exp(-t)).*((t>2)&(t<=3))+...
    +(0.1353-7.3891*exp(-t)).*((t>3)&(t<=4));

plot(t,yt)
xlabel("t")
ylabel("y(t)")
title("y(t)=\int^{6}_{-6}x(\tau)h(t-\tau)d\tau")
set(gca,'fontsize',10);
grid

t=[-0.1:dt:0.5];
y=dt*conv(ht(t),pt(t));
ty=dt*(1:length(y))+2*min(t);
figure
plot(ty,y)
xlabel("t")
ylabel("y(t)")
title("y(t)=\int^{6}_{-6}x(\tau)h(t-\tau)d\tau")
set(gca,'fontsize',10);
grid