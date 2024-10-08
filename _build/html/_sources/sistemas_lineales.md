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

# Análisis de sistemas de tiempo continuo.

Una vez definido el concepto de señales y las operaciones que se realizan en ellas, es posible utilizar esas herramientas para analizar a los sistemas. En general se dice que un sistema es un ente que produce una o varia señales de salida como respuesta a estímulos o señales de entrada ({cite:t}`KamenMATLAB`). En el contexto de las matemáticas, un sistema es una transformación. Una transformación en el contexto de los sistemas es un conjunto de fórmulas u operaciones matemáticas que tienen una gran diversidad de complejidades, desde la estructura más simples hasta los sistemas de ecuaciones integro-diferenciales.

En el contexto de la ingeniería, dos características muy deseables de los sistemas es que estos cumplan con dos propiedades principales: la linealidad y la invarianza en el tiempo.

```{admonition} Conceptos de linealidad e invarianza en el tiempo
* **Linealidad:** Se dice que un sistema es lineal cuando es predecible y poco sensible ante cambios en condiciones iniciales, un sistema lineal es un ente físico que ofrece una salida expresada en forma de una formula o ecuación matemática perfectamente estructurada. 

* **Invarianza en el tiempo:** Un sistema es invariante en el tiempo si sus parámetros no cambian con el paso del tiempo como variable independiente, es decir, la expresión matemática, transformación, fórmula o ecuación permanece inmutable en estructura sin importar el momento en el tiempo en el que se aplique un estímulo y se produzca la salida específica.
```
Matemáticamente, se dice que un sistema es lineal si su estructura cumple con las siguientes expresiones, para $k \in \mathbb{R}$.



```{math}
:label: cond_lienalidad
\begin{eqnarray}
  &Transf\{x_1(t) + x_2(t)\}=Transf\{x_1(t)\} + Transf\{x_2(t)\} \\
   &Transf\{kx_1(t)\}=kTransf\{x_1(t)\}  
	\end{eqnarray}
```

La condición expresada en estas ecuaciones se conoce como la regla de aditividad. La cual establece que: ``La respuesta de un sistema lineal a la suma de dos señales de entrada o estímulos es igual a la suma de las respuestas individuales``. La segunda ecuación se conoce como la regla de la homogeneidad, la cual establece que: ``El escalamiento por una constante de la señal de estímulo o entrada a un sistema, produce una salida del sistema escalada por la misma constante``. La combinación de estas dos reglas dan como resultado el principio de superposición de los sistemas lineales ({cite}`Alkin`). 


```{admonition} Principio de superposición:

```{math}
:label: superposicion
\begin{equation}
  Transf\{k_1x_1(t)+k_2x(t)_2\}=k_1Transf\{x_1(t)\}+k_2Transf\{x_2(t)\}
\end{equation}

````

Los sistemas expresados como una transformación matemática $Transf\{\}$ son lineales si satisfacen el principio de superposición, para cualesquier par de señales $x_1(t)$ y $x_2(t)$ y para cualquier par de constantes arbitrarias $k_1,k_2 \in \mathbb{R}$.