---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
    language: es
kernelspec:
  display_name: Octave
  language: Octave
  name: Octave
---

# Otras definiciones y propiedades de las señales

## Señales determinísticas y aleatorias

Como hemos visto, las señales describen la evolución en el tiempo de alguna variable física presente en un sistema, sea esta variable una entrada o salida al sistema. *Las señales que tienen un modelo matemático en forma cerrada o aproximada se denominan señales determinísticas*, dado que es posible predecir por completo su comportamiento en cualquier instante de tiempo $t$. Un ejemplo claro es la señal que modela al voltaje de alimentación doméstico de 127 volts RMS de amplitud y 60 Hz de frecuencia. 

```{code-cell} Octave
:tags: ["remove-input"]
t=[0:0.0001:0.04];
vs=127*sin(120*pi*t);

plot(t,vs)
set(gcf,'Visible','on')

grid
title("Señal determinística")
 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t)',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 

```

Una señal aleatoria por su parte es aquella que *no tiene un modelo matemático en forma cerrada* por ejemplo la señal de un micrófono en un sistema de audio o la aceleración de la tierra durante un sismo. Dado que muchas de las señales que se encuentran en los fenómenos físicos presentes en la ingeniería, es importante contar con un método que permita estudiar o comprender este tipo de señales, a menudo se utilizan parámetros estadísticos como los valores promedio y distribuciones probabilísticas. A continuación se definen dos propiedades para el análisis y caracterización de las señales.

```{code-cell} Octave
:tags: ["remove-input"]
t=[0:0.0001:0.1];
vs=0.3*sin(2*pi*2*t)+0.25*cos(2.5*pi*150.0*t)+0.5*rand(size(t));

plot(t,vs)
set(gcf,'Visible','on')
grid
title("Señal aleatoria")
 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t)',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 

```



## Potencia y energía en señales

La energía de una señal se define como {cite}`Alkin`:

```{math}
:label: energia
\begin{equation}
E_x=\int^{\infty}_{-\infty} x^2(t) dt
\end{equation}
```
La ecuación {eq}`energia` también se expresa como 

```{math}
:label: energia_abs
\begin{equation}
E_x=\int^{\infty}_{-\infty} |x(t)|^2 dt
\end{equation}
```
donde $|x(t)|$ es la magnitud en el caso de funciones complejas.

## La operación de promediación

La definición matemática de la operación de promediado en el tiempo de una señal es {cite}`Alkin`: 

```{math}
:label: promedia
\begin{equation}
\langle x(t) \rangle = \frac{1}{T_0}\int^{\frac{T_0}{2}}_{-\frac{T_0}{2}} x(t) dt
\end{equation}
```
donde se asume que $x(t)$ es una función periódica con periodo $T_0$. Para señales no periódicas, la ecuación {eq}`promedia` se convierte en:

```{math}
:label: promedia_per
\begin{equation}
\langle x(t) \rangle = \lim_{T\to\infty} \left [ \frac{1}{T}\int^{\frac{T}{2}}_{-\frac{T}{2}} x(t) dt \right ] 
\end{equation}
```
## Potencia de una señal

La potencia de una señal periódica se calcula usando la expresión:

```{math}
:label: potencia
\begin{equation}
P_x= \frac{1}{T_0}\int^{\frac{T_0}{2}}_{-\frac{T_0}{2}} x^2(t) dt 
\end{equation}
```
para señales en la variable compleja:

```{math}
:label: potencia_complex
\begin{equation}
P_x= \lim_{T\to\infty} \left [ \frac{1}{T}\int^{\frac{T}{2}}_{-\frac{T}{2}} |x(t)|^2 dt \right ] 
\end{equation}
```

```{admonition} Señales de energía y señales de potencia  

* Las señales de energía son aquellas que tienen energía finita y potencia cero, es decir: $E_x<\infty$ y $P_x=0$
* Las señales de potencia son aquellas que tienen potencia finita y energía infinita, es decir: $P_x<\infty$ y $E_x \to \infty$
 {cite}`Alkin`
```
## El valor RMS de las señales

En sistemas eléctricos y electrónicos, es muy común usar el parámetro conocido como raíz cuadrada media o root-mean-square por sus sigrlas en inglés. El valor RMS se una señal $x(t)$ se define como {cite}`Alkin`: 

```{math}
:label: RMS
\begin{equation}
X_{RMS}= \sqrt{\frac{1}{T_0}\int^{\frac{T_0}{2}}_{-\frac{T_0}{2}} x^2(t) dt} = \left [ \langle x^2(t) \rangle \right ]^{\frac{1}{2}}  
\end{equation}
```


Un ejemplo de aplicación muy común es el cálculo del valor RMS de una señal sinusoide. Por ejemplo, el valor RMS de una señal definida como $x(t)=Asen(\omega t+\theta)$ se obtiene usando la ecuación {eq}`RMS`

$$
X_{RMS}=\sqrt{\frac{1}{T_0}\int^{\frac{T_0}{2}}_{-\frac{T_0}{2}} x^2(t) dt}=\sqrt{\omega\int^{\frac{1}{2\omega}}_{-\frac{1}{2\omega}} (sen(\omega t+\theta))^2 dt}
$$

Usando la identidad trigonométrica $(Asen(a))^2=\frac{A^2}{2}-\frac{A^2}{2}cos(2a)$ y considerando que $T_0=\frac{1}{\omega_0}$, se obtiene:

$$
X_{RMS}=\sqrt{\omega\int^{\frac{1}{2\omega}}_{-\frac{1}{2\omega}}\frac{1}{2}-\frac{1}{2}cos(2\theta)  dt}=\sqrt{\omega\int^{\frac{1}{2\omega}}_{-\frac{1}{2\omega}}\frac{A^2}{2}dt-\omega\int^{\frac{1}{2\omega}}_{-\frac{1}{2\omega}}\frac{A^2}{2}cos(2\omega+2\theta)  dt}
$$
Esta última expresión se simplifica considerando que $\omega\int^{\frac{1}{2\omega}}_{-\frac{1}{2\omega}}\frac{A^2}{2}cos(2\omega+2\theta)  dt=0$, dado que se calcula la integral del coseno en dos periodos completos, por lo tanto, el valor RMS de la sinusoide considerada es:

$$
X_{RMS}=\frac{A}{\sqrt{2}}
$$

Note que el valor RMS de una señal sinusoide no depende de otro parámetro que no sea su amplitud pico.

## Simetría par e impar

### Simetría par
Una señal valuada en los reales tiene simetría par si se cumple que $x(t)=x(-t)$, por ejemplo las funciones $x(t)=cos(t)$ y $x(t)=t^2$


```{code-cell} Octave
:tags: ["remove-input"]
t=[-pi:0.001:pi];


subplot(1,2,1)
plot(t,cos(t))
set(gcf,'Visible','on')
grid
title("x(t)=cos(t)")
 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t)',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 

subplot(1,2,2)
plot(t,t.^2)
grid
title("x(t)=t^2")
 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t)',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 
```

### Simetría par

Una señal valuada en los reales tiene simetría impar si se cumple que $x(-t)=-x(t)$, por ejemplo las funciones $x(t)=sen(t)$ y $x(t)=t^3$


```{code-cell} Octave
:tags: ["remove-input"]
t=[-pi:0.001:pi];


subplot(1,2,1)
plot(t,sin(t))
set(gcf,'Visible','on')
grid
title("x(t)=sen(t)")
 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t)',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 

subplot(1,2,2)
plot(t,t.^3)
grid
title("x(t)=t^3")
 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t)',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 
```
