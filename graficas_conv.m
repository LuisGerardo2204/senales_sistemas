clear
close all
clc

t=[-0.1:0.0001:0.3];
%xt= @(x) sin(11.5*x).*exp(-3*x);
xt= @(x) 1.63*(x>=0);

subplot(1,2,1)
plot(t,xt(t))
xlabel("t")
ylabel("x(t)")
title("Señal estímulo original")
set(gca,'fontsize',10);
grid on

subplot(1,2,2)
plot(t,xt(t))
xlabel("\lambda")
ylabel("x(\lambda)")
title("Cambio de variable t \rightarrow \lambda")
set(gca,'fontsize',10);
grid on
figure
ht=@(x) (x>=0).*(261.7287*sin(239.58*x)).*exp(-52.98*x);

subplot(2,2,1)
plot(t,ht(t))
xlabel("t")
ylabel("h(t)")
title("Señal respuesta al impulso original")
set(gca,'fontsize',10);
grid on

subplot(2,2,2)
plot(t,ht(t))
xlabel("\lambda")
ylabel("h(\lambda)")
title("Cambio de variable t \rightarrow \lambda")
set(gca,'fontsize',10);
grid on

subplot(2,2,3)
plot(-t,ht(t))
xlabel("t")
ylabel("h(-\lambda)")
title("Reversión \lambda \rightarrow -\lambda ")
set(gca,'fontsize',10);
grid on

t2=[-0.1:0.0001:0.3];
subplot(2,2,4)
plot(-t,(-t<=0.1).*ht(t+0.1))
xlabel("\lambda")
ylabel("h(t-\lambda)")
title("h(t-\lambda)")
set(gca,'fontsize',10);
grid on

figure
plot(t,0.0001*cumtrapz((t>=0).*ht(t).*xt(t)))
xlabel("t")
ylabel("y(t)")
title("y(t)=\int^{0.3}_{-0.1}x(\lambda)h(t-\lambda)d\lambda")
set(gca,'fontsize',10);
grid on

V=load("RLC_lineal.txt");
hold on
plot(V(:,1),V(:,2))