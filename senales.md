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

# Conceptos básicos: Señales.

Para comenzar con el curso de análisis de señales y sistemas, estableceremos los conceptos más importantes que constituyen el punto de partida. Los objetivos de esta sección se presentan a continuación:

* Establecer el concepto de señal y su modelo matemático.
* Definir los tipos principales de señales con el fin de establecer su distinción.
* Presentar las operaciones que se realizan con las señales para su análisis.
* Realizar algunas prácticas con MATLAB u Octave para construir señales y realizar operaciones con ellas.
* Explorar las características principales de las señales.

# Primera parte: ¿Qué es una señal?

 Una señal es una función que en ingeniería se concibe como una función valuada en los reales, es decir, una señal es una función escalar de la variable independiente $t$({cite:t}`KamenMATLAB`). En el contexto de este curso, la variable independiente $t$, representa al tiempo, entendido como un número real, es decir $t\in \mathbb{R}$. A menudo, para fines de simplificación, se expresa a una señal en general como $x(t)$. Otra manera de entender el concepto de señal, es usando la siguiente definición:

 ```{admonition} Concepto de señal

Una señal es una función que describe la evolución en el tiempo de alguna variable o parámetro de interés, por ejemplo: la posición de un móvil, la aceleración de un vehículo, la temperatura de una caldera, entre otros. La variable independiete de la función mencionada es el tiempo. Las señales se clasifican en dos grandes grupos ({cite:t}`KamenMATLAB`,{cite}`Alkin`):

 * **Señales de tiempo contínuo**: Se trata de señales que toman valores para cada instante de tiempo $t$. La variable independiente $t$ puede tener variaciones infinitecimales y la función x(t) tendrá un valor para cada una de esas variaciones. A este tipo de señales se les conoce como señales analógicas.

* **Señales de tiempo discreto**: Se trata de señales que solo estan definindas, es decir, toman valores únicamente en isntantes determinados de tiempo. Estas señales son ampliamente utilizadas en los sistemas digitales. 

````

Ejemplos de señales analógicas o continuas son: El voltaje de alimentación de una toma de pared, la señal de voz recopilada por un micrófono y la salida de un sensor de presión del tipo piezo-eléctrico. Ejemplos de señales de tiempo discreto son: Las muestras de un sensor de temperatura, colectadas por un sistema digital, la señal de un micrófono almacenada en un archivo .mp3.

## Representación numérica de señales

Las señales se pueden representar usando software de matemáticas, el software especializado de matemáticas MATLAB ofrece una excelente opción para la representación numérica de señales y sistemas. Una alternativa a MATLAB la constituye el software de libre descarga llamado Octave. A continuación se presenta un ejemplo de la representación de una señal usando software. Se representará numéricamente a la señal que representa al voltaje RMS (RMS es el valor que registra un multímetro común) disponible en una toma de pared común, en este caso particular, dicha señal es representada por la expresión matemática:

$$
x(t)=127sen(120\pi t)
$$

El código de MATLAB para representar esta señal es el siguiente:

```{code-cell} Octave
:tags: [remove-stderr]
clear
close all
t=[0:0.0001:0.08];%Se define un vector de valores de tiempo.
x_t=127*sin(180*t);%Se define la función que describe la señal.
figure
plot(t,x_t)
set(gcf,'Visible','on')
grid

 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','t',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x(t) [V]',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 
```
 
La versión discreta se presenta usando las siguientes líneas de código:

```{code-cell} Octave
:tags: [remove-stderr]
#:tags: ["remove-input"]
clear
close all
n=[0:15:800];%Se define un vector de valores de tiempo.
x_n=127*sin(0.018*n);%Se define la función que describe la señal.
figure
stem(n,x_n)%Representación discreta de la señal
set(gcf,'Visible','on')
grid

 set(gca,'defaulttextinterpreter','latex')
  
   set(get(gca,'XLabel'),'String','nT',...
                    'FontName','times news roman',... %Ajustes de rótulos y formato de letra
                    'FontAngle','normal',...
                    'FontSize',20)
% 
 set(get(gca,'YLabel'),'String','x[nT] [V]',...
                     'FontName','times news roman',...
                     'FontAngle','normal',...
                     'FontSize',20)

 
set(gca,'fontsize',20);
set(gca,'fontname','Times New Roman','FontWeight','Bold'); 
```
