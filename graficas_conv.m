clear
close all
clc
dt=0.0001;

t=[-3:dt:3];
ht= @(x) exp(-x).*((x>=0)-(x>=2));
pt= @(x) ((x>=0)&(x<1))-((x>=1)&(x<2));


figure
plot(t,ht(t))
figure
plot(t,pt(t))

figure

subplot(3,3,1)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,4)
plot(-t,ht(t-0.2))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid


subplot(3,3,7)
plot(-t,ht(t-0.5).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid


subplot(3,3,2)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,5)
plot(-t,ht(t+0.5))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,8)
plot(-t,ht(t+0.5).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid



subplot(3,3,3)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,6)
plot(-t,ht(t+1.5))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,9)
plot(-t,ht(t+1.5).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid


figure

subplot(3,3,1)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,4)
plot(-t,ht(t+2.5))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid


subplot(3,3,7)
plot(-t,ht(t+2.5).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid


subplot(3,3,2)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)")
title("x(\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,5)
plot(-t,ht(t+3.5))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,8)
plot(-t,ht(t+3.5).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid



subplot(3,3,3)
plot(t,pt(t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,6)
plot(-t,ht(t+4.5))
xlabel("\tau")
ylabel("h(t-\tau)")
title("h(t-\tau)")
set(gca,'fontsize',10);
grid

subplot(3,3,9)
plot(-t,ht(t+4.5).*pt(-t))
xlabel("\tau")
ylabel("x(\tau)h(t-\tau)")
title("x(\tau)h(t-\tau)")
set(gca,'fontsize',10);
grid




y=dt*conv(ht(t),pt(t));
ty=0.0001*(1:length(y))+2*min(t);




figure
plot(ty,y)
grid