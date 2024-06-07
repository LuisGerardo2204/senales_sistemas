clear
close all
clc

wn=40*2*pi;
psi=0.02;

omega=[0.1:0.01:5000*2*pi];
magG=(-40*(log10(omega/wn))).*(omega>=wn);
fase=(-90)*(log10(omega/(wn*0.1))).*(omega>(wn*0.1))+(90)*(log10(omega/(wn*10))).*(omega>(wn*10));


figure
semilogx(omega/(2*pi),magG,'LineWidth',2)
grid
hold on
semilogx(omega/(2*pi),20*log10(abs((wn^2)./((i*omega).^2+2*psi*wn*(i*omega)+wn.^2))),'LineWidth',2)
title("20log_{10}|G(j\omega)|")
xlabel("log_{10}(\omega) [Hz]")
ylabel("|G(j\omega)| dB")
legend("Asymptote","Real curve")
axis([0 max(omega/(2*pi)) -80 45])

set(gca,'fontsize',30);
set(gca,'fontname','Times New Roman','FontWeight','Normal');
