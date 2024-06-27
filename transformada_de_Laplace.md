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

# La transformada de Laplace aplicada al análisis de sistemas.

Como hemos visto en secciones anteriores, un método para representar la relación que existe entre las entradas y las salidas de un sistemas es una ecuación diferencial e incluso un conjunto de ecuaciones diferenciales cuando se trata de sistemas con algún tipo de acoplamiento. Hemos mencionado también que la solución de la ecuación o sistema de ecuaciones diferenciales del que modelan al sistema, representa la evolución en le tiempo de la salida del sistema y permite conocer su comportamiento y situación en cada instante de tiempo $t$. Hemos usado un método para resolver la ecuación diferencial que consiste en proponer el uso de un polinomio auxiliar para encontrar la solución a la ecuación diferencial homogénea asociada y la solución particular, imponiendo las condiciones iniciales al sistema. Este método tiene su fundamento principalmente en el cálculo diferencial e integral, debido a que involucra derivadas e integrales.

Por otra parte, hemos visto la importancia del parámetro de la frecuencia en la determinación de la salida de los sistemas ante una señal armónica, es decir, una señal que involucra contenidos sinusoidales. La transformada de Laplace es una herramienta matemática que permite el análisis de los sistemas en términos de la frecuencia. Dicho de manera formal, la transformada de Laplace mapea o transforma a los sistemas del dominio del tiempo al dominio de la frecuencia. La definición matemática de la transformada involucra a una integral en términos de una variable independiente que tiene una parte real y una parte imaginaria, es decir es una integral en variable compleja:

```{math}
:label: transformada_def
\begin{equation}
  X(s)=\int^{\infty}_{-\infty}x(t)e^{-st}dt
	\end{equation}
```

donde $s$ es una variable compleja que se compone de una parte real y una parte imaginaria, es decir $s=\sigma+j\omega$. Como en el caso de la solucíon de la ecuación diferencial homogénea, la parte imaginaria de $\omega$, de la variable independiente $s$, representa a la frecuencia.


```{note} 

La definición y notación matemática de la transformada de Lapalace se resumen de la siguiente manera:

$$
\begin{equation}
  X(s)=\int^{\infty}_{-\infty}x(t)e^{-st}dt
	\end{equation}
$$

con $s=\sigma+j\omega$ y $j=\sqrt{-1}$. La notación matemática para la transformada de Laplace, es decir el operador que significa la aplicación de la transformada de Laplace es:

$$
\begin{equation}
 X(s)=\mathscr{L} \left\{ x(t) \right\} 
 \end{equation}
 $$

La Transformada de Laplace es un operador lineal y bi-dideccional:

$$
\begin{equation}
 x(t) \leftrightarrows X(s) 
 \end{equation}
 $$
 
```

```{list-table} Tabla de transformadas de Laplace comunes
:header-rows: 1
:name: Tabla_transformadas
* - $$x(t)$$
  - $$X(s)=\mathscr{L} \left\{ x(t) \right\} $$
* - $$\dot{x}=\frac{dx(t)}{dt}$$
  - $$sX(s)-x(0)$$
* - $$\ddot{x}=\frac{d^2x(t)}{dt^2}$$
  - $$s^2X(s)-sx(0)-\dot{x}(0)$$
* - $$x(t)=A,~~A=cte=Au(t)$$  
  - $$\frac{A}{s}$$ 
* - $$\delta(t)=impulso$$ 
  - $$1$$
* - $$x(t)=Asen(\omega t)$$ 
  - $$\frac{A\omega}{s^2 + \omega^2}$$  
* - $$x(t)=Acos(\omega t)$$ 
  - $$\frac{As}{s^2 + \omega^2}$$  
* - $$x(t)=Ae^{-\alpha t}sin(\omega t)$$ 
  - $$\frac{A\omega}{(s+\alpha)^2 + \omega^2}$$  
* - $$x(t)=Ae^{-\alpha t}cos(\omega t)$$ 
  - $$\frac{A(s+\alpha)}{(s+\alpha)^2 + \omega^2}$$        
```

La transformada de Laplace es especialmente útil en análisis de sistemas dada su capacidad de algebrizar, o convertrir un problema de cálculo en uno de álgebra. Como se verá a continuación, al aplicar la transformada de Laplace a una ecuación diferencial, la función $x(t)$ se convierte en una incógita que es suceptible de ser despejada y, por lo tanto ser tratada como una incógnita numérica en una ecuación que antes de aplicar el operador transformada era una función del tiempo $t$, expresada en términos de sus derivadas.

## Ejemplos de aplicación de la Transformada de Laplace a la solución de ecuaciones diferenciales.

En esta sección se presentan algunos ejemplos de ecuaciones diferenciales resueltas usando la Transformada de Laplace. Como hemos visto antes, la solución de la ecuación diferencial que modela al sistema nos permite entender al sistema, dado que la función solución describe perfectamente a la evolución en el tiempo de la salida del sistema bajo análisis. A continuación se presentan algunos ejemplos resueltos de ecuaciones diferenciales utilizando la Transformada de Laplace.

1. Encuentre la solución de la ecuación diferencial:

$$
4.5\frac{d^2x(t)}{dt^2}+2\frac{dx(t)}{dt}+350x(t)=0
$$

Sujeta a las condiciones iniciales $x(0)=0.01$ y $\dot x(0)=0.5$. En adelante, manejaremos la notación compacta; $\frac{d^2x(t)}{dt^2}=\ddot{x}$ y $\frac{x(t)}{dt}=x(0)$, también se especifica que $x(0)$ es el valor de la función solución evaluada en el instante $t=0$ y $\dot{x}(0)$ es la derivada de la función solución en el mismo instante.  El hecho de que estas dos constantes tengan un valor asignado significa que la función solución es única y propia del caso particular planteado por la misma ecuación diferencial, dicho de forma coloquial, estos dos valores le dan un nombre y apellido a la función solución. Para resolver la ecuación diferencial, es decir, para encontrar aquella función $x(t)$ que satiface a la ecuación planteada se aplica el operador transformada $\mathscr{L} \left\{  \right\}$ a ambos lados de la ecuación diferencial:


$$
\mathscr{L} \left\{ 4.5\ddot{x}+2\dot{x}+350x \right\} =\mathscr{L} \left\{ 0 \right\}
$$

Haciendo uso de la {numref}`Tabla_transformadas` y considerando que la transformada de Laplace es un operador lineal ({cite}`Alkin`), encontramos que:

$$
\mathscr{L} \left\{ 4.5 \ddot{x}  \right\}+\mathscr{L} \left\{ 2\dot{x} \right\}+\mathscr{L} \left\{ 350 \right\} =0
$$

Evaluando las transformadas individuales:

$$
\begin{eqnarray}
&\mathscr{L} \left\{ 4.5 \ddot{x}  \right\}=4.5[ s^2X(s)-sx(0)-\dot{x}(0) ]\\
&\mathscr{L} \left\{ 2 \dot{x}  \right\}=2[ sX(s)-x(0)]\\
&\mathscr{L} \left\{ 350 x  \right\}=350X(s)
\end{eqnarray}
$$

Agrupando las transformadas individuales, para reconstruir la ecuación individual se tiene:

$$
4.5[ s^2X(s)-sx(0)-\dot{x}(0) ]+2[ sX(s)-x(0)]+350X(s)=0
$$

Sustituyendo los valores numéricos de las condiciones iniciales $x(0)=0.01$ y $\dot x(0)=0.5$:

$$
4.5[ s^2X(s)-0.01s-0.5]+2[ sX(s)-0.01]+350X(s)=0
$$

De esta última expresión se despeja $X(s)$ 

$$
X(s)=\frac{0.045s+2.27}{4.5s^2+2s+350}
$$

La función solución $x(t)$ es la transformada inversa de la función $X(s)$. Para poder aplicar alguno de los pares transformados ya conocidos y reportados en la {numref}`Tabla_transformadas` es necesario manipular algebráicamente a la expresión para $X(s)$ con el fin de asimilarla a una estructura conocida. Como primera manipulación se expresa a $X(s)$ como la suma de dos fracciones parciales:

$$
X(s)=\frac{0.045s}{4.5s^2+2s+350}+\frac{2.27}{4.5s^2+2s+350}
$$

De esta manera hemos logrado asimilar a la función $X(s)$ a la suma de dos pares transformados del tipo:

$$
Ae^{-\alpha t}sin(\omega t) \leftrightarrows \frac{A\omega}{(s+\alpha)^2 + \omega^2} 
$$

$$
Ae^{-\alpha t}cos(\omega t) \leftrightarrows \frac{A(s+\alpha)}{(s+\alpha)^2 + \omega^2}  
$$     

donde $A$,$\alpha$ y $\omega$ son constantes. La diferencia principal entre esta expresión y los pares transformados de la {numref}`Tabla_transformadas` es la estructura del denominador. Dividiendo el denominador entre $4.5$ se obtiene:

$$
X(s)=\frac{0.045s}{4.5\left ( s^2+\frac{2s}{4.5}+\frac{350}{4.5} \right )}+\frac{2.27}{4.5 \left (s^2+\frac{2s}{4.5}+\frac{350}{4.5}\right )}
$$

Es posible completar el trinomio cuadrado perfecto en el denominador $s^2+\frac{2s}{4.5}+\frac{350}{4.5}$ sumando y restando $\left ( \frac{1}{4.5}\right ) ^2$ para obtener:

$$
s^2+\frac{2s}{4.5}+\frac{350}{4.5}=\left ( s+\frac{1}{4.5}\right )^2+\frac{350}{4.5}-\left ( \frac{1}{4.5} \right ) ^2
$$

Si se desarrolla el polinomio puede comprobarse que no se altera el polinomio original:

$$
\left ( s+\frac{1}{4.5}\right )^2= s^2+\frac{2s}{4.5}+\left ( \frac{1}{4.5}\right ) ^2+\frac{350}{4.5}-\left ( \frac{1}{4.5}\right ) ^2
$$

Las fracciones parciales anteriormente planteadas se puede reescribir como:

$$
X(s)=\frac{0.045s}{4.5\left ( \left ( s+\frac{1}{4.5}\right )^2+\frac{350}{4.5}-\left ( \frac{1}{4.5} \right ) ^2\right )}+\frac{2.27}{4.5\left (\left ( s+\frac{1}{4.5}\right )^2+\frac{350}{4.5}-\left ( \frac{1}{4.5} \right ) ^2\right )}
$$

Simplificando y haciendo los cálculos numéricos:

$$
X(s)=\frac{0.01s}{ \left ( s+\frac{1}{4.5}\right )^2+77.73}+\frac{0.5044}{\left ( s+\frac{1}{4.5}\right )^2+77.73 }
$$

Se observa que el numerador de la primera fracción parcial aún no es equivalente a ninguna de las expresiones que se encuentran en la {numref}`Tabla_transformadas`, en concreto, al par transformado $\frac{As}{(s+\alpha)^2+\omega^2}$, mediante la manipulación algebraica se puede llevar a la forma adecuada para aplicar las reglas de transformación conocidas. Sumando y restando $0.01(0.22)$ en el numerador:


$$
X(s)=\frac{0.01s+0.01(0.22)\textcolor{red}{-0.01(0.22)}}{ \left ( s+0.22\right )^2+77.73}+\frac{0.5044}{\left ( s+0.22\right)^2+77.73 }
$$

Lo anterior hace posible expresar:

$$
X(s)=\frac{0.01(\textcolor{red}{s+0.22})-0.01(0.22)}{ \left ( s+0.22 \right )^2+77.73}+\frac{0.5044}{\left ( s+0.22\right )^2+77.73 }
$$

Separando las fracciones nuevamente:

$$
X(s)=\frac{0.01(\textcolor{red}{s+0.22})}{\left ( \textcolor{red}{s+0.22} \right )^2+77.73}+\frac{0.5044}{\left ( s+0.22\right )^2+77.73 }-\frac{0.01(0.22)}{\left ( s+0.22\right )^2+77.73 }
$$

Esta última expresión se simplifica al sumar las fracciones similares, es decir aquellas con constantes en el numerador, esto es posible debido al hecho de que el denominador es el mismo para ambas fracciones.

$$
X(s)=X_1(s)+X_2(s)=\frac{0.01(s+0.22)}{\left (s+0.22 \right )^2+77.73}+\frac{0.5022}{\left ( s+0.22\right )^2+77.73 }
$$

De esta manera es posible obtener la función solución $x(t)$ aplicando la transformada inversa de Laplace a la expresión anterior. de la {numref}`Tabla_transformadas` se sigue que:

$$
x(t)=\mathscr{L} ^{-1} \left\{ X(s) \right \} =\mathscr{L} ^{-1} \left\{  \frac{0.01(s+0.22)}{\left (s+0.22 \right )^2+77.73}+\frac{0.5022}{\left ( s+0.22\right )^2+77.73 } \right \}
$$

Las fracciones parciales de la expresión anterior tienen caracteristicas comunes con pares trasformados específicos mostrados en la {numref}`Tabla_transformadas` de la forma:  

$$
x(t)=\mathscr{L} ^{-1} \left\{  \frac{\textcolor{red}{0.01}(s+\textcolor{orange}{0.22})}{\left (s+\textcolor{orange}{0.22} \right )^2+\textcolor{green}{77.73}}+\frac{\textcolor{blue}{0.5022}}{\left ( s+\textcolor{orange}{0.22}\right )^2+\textcolor{green}{77.73} } \right \}
$$

Que son compatibles en estructura con las expresiones:

$$
x(t)=\textcolor{blue}{A}e^{\textcolor{orange}{\alpha}t}sen(\textcolor{green}{\omega}t)+\textcolor{red}{B}e^{\textcolor{orange}{\alpha}t}cos(\textcolor{green}{\omega}t)
$$

Sin embargo que para aplicar las tablas se tienen que seguir manipulando algebraicamente las dos fraciones parciales para poder aplicar los pares transformados conocidos. Dado que las fórmulas en la tabla tienen las estructuras:

$$
\mathscr{L} ^{-1} \left\{ \frac{\textcolor{blue}{A}\textcolor{green}{\omega}}{(s+\textcolor{orange}{\alpha})^2+\textcolor{green}{\omega}}  \right \}=\textcolor{blue}{A}e^{\textcolor{orange}{\alpha}t}sen(\textcolor{green}{\omega}t)~~~~\mathscr{L} ^{-1} \left\{ \frac{\textcolor{red}{B}s}{(s+\textcolor{orange}{\alpha})^2+\textcolor{green}{\omega}}  \right \}=\textcolor{red}{B}e^{\textcolor{orange}{\alpha}t}cos(\textcolor{green}{\omega}t)
$$

Vemos que falta el término $\textcolor{green}{\omega}$ en el numerador, entonces lo anexamos multiplicando y dividiendo entre $\textcolor{green}{\omega}$, que en este caso tiene el valor numérico $\textcolor{green}{\omega}=\textcolor{green}{\sqrt{77.73}}$ para obtener:

$$
X(s)=X_1(s)+X_2(s)=\frac{\textcolor{red}{0.01}(s+\textcolor{orange}{0.22})}{\left (s+\textcolor{orange}{0.22} \right )^2+\textcolor{green}{77.73}}+\frac{\textcolor{blue}{0.5022}}{\textcolor{blue}{\sqrt{77.73}}} \left ( \frac{\textcolor{green}{\sqrt{77.73}}}{\left ( s+\textcolor{orange}{0.22}\right )^2+\textcolor{green}{77.73} }  \right )
$$

Para resolver finalmente la transformada de Laplace inversa se hacen las equivalencias:

$$
\begin{eqnarray}
\textcolor{blue}{A=\frac{0.5022}{\sqrt{77.73}}}\\
\textcolor{red}{B=0.01}\\
\textcolor{orange}{\alpha=0.22}\\
\textcolor{green}{\omega=\sqrt{77.73}}
\end{eqnarray}
$$

Sustituyendo se obtiene finalmente la función solución de la ecuación diferencial:

$$
x(t)=\textcolor{blue}{A}e^{\textcolor{orange}{\alpha}t}sen(\textcolor{green}{\omega}t)+\textcolor{red}{B}e^{\textcolor{orange}{\alpha}t}cos(\textcolor{green}{\omega}t)=\textcolor{blue}{\frac{0.5022}{\sqrt{77.73}}}e^{\textcolor{orange}{-0.22}t}sen(\textcolor{green}{\sqrt{77.73}}t)+\textcolor{red}{0.01}e^{\textcolor{orange}{-0.22}t}cos(\textcolor{green}{\sqrt{77.73}}t)
$$
$$
x(t)= e^{-0.22t} \left ( \frac{0.5022}{\sqrt{77.73}} sen(\sqrt{77.73}t) + 0.01cos(\sqrt{77.73}t) \right )
$$ 
