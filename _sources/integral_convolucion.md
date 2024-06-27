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

# Integral de convolución en sistemas lineales.

Para un sistema lineal e invariante en el tiempo, la operación de convolución permite el cálculo de la salida, como la respuesta a una señal arbitraria de estímulo $x(t)$, en términos de su respuesta al impulso $h(t)$, por medio de la integral de convolución definida como:

```{math}
:label: convolucion
\begin{equation}
  y(t)=\int^{\infty}_{-\infty}x(\tau)h(t-\tau)d\tau
	\end{equation}
```

La ecuación {eq}`convolucion` se conoce como la integral de convolución para sistemas de tiempo continuo ({cite:t}`Alkin`). Se dice entonces, que la señal de salida $y(t)$ de un sistema se obtiene aplicando la convolución de la señal de entrada o estímulo $x(t)$ con la respuesta al impulso $h(t)$ del sistema. La convolución se representa por medio del operador $*$, el cual se denomina el operador convolución.


```{math}
:label: convolucion_operador
\begin{equation}
  y(t)=x(t)*h(t)=\int^{\infty}_{-\infty}x(\tau)h(t-\tau)d\tau
	\end{equation}
```

```{admonition} Convolución de sistemas de tiempo contínuo:
El operador convolución de la señal de entrada $x(t)$ y la respuesta al impulso de un sistema $h(t)$ proporciona la salida $y(t)$ del sistema como:

```{math}
:label: convolucion_conmuta
\begin{eqnarray}
  y(t)=x(t)*h(t)=\int^{\infty}_{-\infty}x(\tau)h(t-\tau)d\tau\\
  y(t)=h(t)*x(t)=\int^{\infty}_{-\infty}h(\tau)x(t-\tau)d\tau\\
	\end{eqnarray}
```
La operación de convolución es conmutativa.