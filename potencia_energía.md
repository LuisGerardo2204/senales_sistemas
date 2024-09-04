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

## Señales deterministicas y aleatorias

Como hemos visto, las señales describen la evolución en el tiempo de alguna variable física presente en un sistema, sea esta variable una entrada o salida al sistema. *Las señales que tienen un modelo matemático en forma cerrada o aproximada se denominan señales determinísticas*, dado que es posible predecir por completo su comportamiento en cualquier instante de tiempo $t$. Un ejemplo claro es la señal que modela al voltaje de alimentación doméstico de 127 volts RMS de amplitud y 60 Hz de frecuencia. 

Una señal aleatoria por su parte es aquella que *no tiene un modelo matemático en forma cerrada* por ejemplo la señal de un micrófono en un sistema de audio o la aceleración de la tierra durante un sismo. Dado que muchas de las señales que se encuentran en los fenómenos físicos presentes en la ingeniería, es importante contar con un método que permita estudiar o comprender este tipo de señales, a menudo se utilizan parámetros estadísticos como los valores promedio y distribuciones probabilísticas. A continuación se definen dos propiedades para el análisis y caracterización de las señales.

## Potencia y energía en señales

La energía de una señal se define como {cite}`Alkin`:

```{math}
:label: energia
\begin{equation}
E_x=\int^{\infty}_\infty x^2(t) dt
\end{equation}
```
La ecuación {eq}`energia` también se expresa como 

```{math}
:label: energia_abs
\begin{equation}
E_x=\int^{\infty}_\infty |x(t)|^2 dt
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
P_x= \frac{1}{T_0}\int^{\frac{T_0}{2}}_{-\frac{T_0}{2}} |x(t)|^2 dt 
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


