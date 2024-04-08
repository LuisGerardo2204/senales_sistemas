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

# Respuesta al impulso de sistemas de tiempo continuo.

Una ecuación diferencial ordinaria, lineal y de coeficientes constantes se puede utilizar como el modelo matemático o la respresentación de un sistema dinámico. Existe una representación alternativa que resulta muy útil para el modelado de los sistemas es llamada `la respuesta al impulso del sistema`({cite:t}`KamenMATLAB`, {cite:t}`Alkin`). La función umpulso unitario, conocida como función Delta de Dirac se define matemáticamente como:

```{math}
:label: impulso
\begin{equation}
         \delta(t)= \left\{ \begin{array}{lcc} 1 & si & 0 = t \\ \\ 0 & si &  t \neq 0   \end{array} \right.
		 \end{equation}
```

Cuando la función $\delta(t)$ se usa como una función estímulo para un sistema, a la salida $y(t)$ se le denomina respuesta al impulso del sistema y se usa la notación $h(t)$ para distinguirla de las posibles salidas adel sistema ante entradas o estímulos arbitrarios $x(t)$. 

## Determinación de la respuesta al impulso de un sistema 

Como hemos observado en la Práctica 3, es posible determinar la salida $y(t)$ de un sistema, al resolver la ecuación diferencial que modela al sistema. Esta ecuación puede ser homogénea o forzada, con las soluciones candidatas condensadas en 
{numref}`Tabla_sol` y {numref}`Tabla_forzada`. Entre las funciones candidatas mostradas en tales tablas, no se presenta en ningún caso la función impulso unitario definida en la ecuación {eq}`impulso`, sin embargo se cumple que:

```{math}
:label: deriv_impulso
\begin{equation}
          \frac{du(t)}{dt}=\delta(t)
		 \end{equation}
```


```{admonition} Determinación de la respuesta al impulso de un sistema:

Para poder encontrar la respuesta forzada de un sistema cuando el estímulo o entrada es una señal del tipo impulso unitario se procede a encontrar la respuesta al escalón unitario del sistema (caso cuando la entrada es una constante de amlitud 1) y se obtiene la derivada de la respuesta resultante.

Sea $y(t)$ la respuesta al escalón unitario $u(t)$ de un sistema, es decir $y(t)=Transf\{u(t)\}$, la respuesta al impulso unitario $h(t)=Transf\{\delta(t)\}$ de ese sistema es:

```{math}
:label: resp_impulso
\begin{equation}
          \frac{dy(t)}{dt}=h(t)
		 \end{equation}
```
Por ejemplo para el sistema eléctrico analizado en el caso anterior, cuyo diagrama se muestra en la {numref}`RLCeq1` y cuyos parámetros son los de la {numref}`Tabla_paramRLC`, la respuesta al impulso de obtiene encontrando primero su respuesta al escalón unitario, es decir, cuando el modelo del sistema es:


```{math}
:label: RLC_escalon
\begin{equation}
  1.661\times 10^{-5}\frac{d^2v_c(t)}{dt^2}+ 0.0018\frac{dv_c(t)}{dt}+v_c(t)=u(t)
	\end{equation}
```

Se consideran condiciones iniciales cero, es decir: $v(0)=0$ y $\dot{v}(0)=0$ y además $u(t)=1$ para $t>0$ para obtener:

```{math}
:label: RLC_escalon2
\begin{equation}
  1.661\times 10^{-5}\frac{d^2v_c(t)}{dt^2}+ 0.0018\frac{dv_c(t)}{dt}+v_c(t)=1
	\end{equation}
```
De aquí se desprende que, de acuerdo con la {numref}`Tabla_sol` y deaa auerdo con el ejemplo anterior, donde se calcularon las raices complejas $-0.5298 \pm 2.3958i$ la solución de la homogenea asociada es:

$$
v_{ch}=(C_1cos(239.58t)+C_2sen(239.58t))e^{-52.98t}
$$

Para este sistema, se cumple que la solución particular es una constante, $v_{cp}=1$, por lo tanto la solución completa para el voltaje en el capacitor adquiere la forma:

```{math}
:label: sol_RLC_escalon
\begin{equation}
   v_c(t)=v_{ch}+v_{p}=(C_1cos(239.58t)+C_2sen(239.58t))e^{-52.98t}+1
\end{equation}
````

Sabiendo que $v_c(0)=0$ y $\dot{v}_c(0)=0$ y sustituyendo la ecuación {eq}`sol_RLC_escalon` en la ecuación {eq}`RLC_escalon` se obiene el valor de los coeficientes $C_1$ y $C_2$.

$$
\begin{eqnarray}
 v_c(t)=(C_1cos(239.58t)+C_2sen(239.58t))e^{-52.98t}+1\\
\dot{v}_c(t)=\frac{d[(C_1cos(239.58t)+C_2sen(239.58t))e^{-52.98t}+1]}{dt}\\
\end{eqnarray}
$$

Evaluando $v_c(0)$ y $\dot{v}_c(0)$:

```{math}
:label: eval_v0_escalon
\begin{eqnarray}
 v_c(0)=(C_1cos(239.58(0))+C_2sen(239.58(0)))e^{-52.98(0)}+1=0\\
\dot{v}_c(0)=(-239.58C_1sen(0)+239.58C_2cos(0))e^{0}-52.98(C_1cos(0)+C_2sen(0))e^{0}
\end{eqnarray}
````
Las ecuaciones {eq}`eval_v0_escalon` conducen a:


$$
v_c(0)=(C_1cos(0)+C_2sen(0))e^{0}+1.63=0\Longrightarrow C_1=-1
$$

Sustituyendo $C_1$ en la ecuación {eq}`eval_v0`

$$
\dot{v}_c(0)=(390.5154sen(0)+239.58C_2cos(0))e^{0}-52.98(-cos(0)+C_2sen(0))e^{0}=0
$$

De donde se obtiene que:

$$
239.58C_2+52.98=0\Longrightarrow C_2=-0.2211
$$

Luego entonces, la solución completa de la ecuación diferencial, o bien el voltaje en el capacitor $v_c(t)$ es:

```{math}
:label: sol_vc_escalon
\begin{equation}
   v_c(t)=v_{ch}+v_{cp}=(-cos(239.58t)-0.2211sen(239.58t))e^{-52.98t}+1
\end{equation}
````
La respuesta al impulso es la derivada de $v_c(t)$ respecto del tiempo, entonces:

```{math}
:label: h_RLC_deriv
\begin{equation}
   h(t)=\frac{v_c(t)}{dt}=\frac{(-cos(239.58t)-0.2211sen(239.58t))e^{-52.98t}+1}{dt}
\end{equation}
````
Luego entonces:

```{math}
:label: h_RLC_final
\begin{eqnarray}
   h(t)=(250.7588sen(239.58t)-0.0089cos(239.58t))e^{-52.98t}
\end{eqnarray}
````

La gráfica de la respuesta al impulso del sistema se puede obtener en MATLAB con las siguientes líneas de código:

```{code-cell} Octave
:tags: [remove-stderr]

clear 
close all

t=[0:0.001:0.3];

ht=(250.7588*sin(239.58*t)-0.0089*cos(239.58*t)).*exp(-52.98*t);

plot(t,ht)
title("Respuesta al impulso")
xlabel("t [s]")
ylabel("v_c(t) [V]")
set(gca,'fontsize',30);
```
