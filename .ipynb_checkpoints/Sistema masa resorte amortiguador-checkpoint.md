# Sistema masa resorte amortiguador 

A continuación analizaremos el sistema masa resorte amortiugador, consistente en el juguete mostrado en la {numref}`figura11`.


## Modelo matemático del sistema masa resorte amortiguador

La ecuación diferencial ordinaria que modela al sistema vibratorio de naturaleza mecánica es la siguiente: 

```{math}
:label: MBKeq1
\begin{eqnarray}
    m\frac{d^2x}{dt^2}+b\frac{dx}{dt}+kx=0\\
    acc=\frac{dx^2}{dt^2}
\end{eqnarray}
```

con $acc$ la aceleración de la masa y $x(t)$ la posición. En forma compacta se puede escribir:

```{math}
:label: MBKeq2
\begin{eqnarray}
    m\ddot{x}+b\dot{x}+kx=0\\
    acc=\ddot{x}
\end{eqnarray}
```
Con $\dot{}$ el operador derivada $\frac{dx}{dt}=\dot{x}$

```{figure} /images/Imagen16.png
:height: 250px
:name: MBKfig1
```
A continuación se ejemplificará el uso de las ecuaciones diferenciales y los métodos de Runge-Kutta (programado en python), en el modelado matemático del juguete de madera mostrado en la {numref}`figura11`, el cual será tratado como un sistema masa resorte amortiguador, con el modelo matemático definido por la ecuación {eq}`MBKeq2`.

```{list-table} Tabla de parámetros
:header-rows: 1
:name: Tabla 2
* - $$Parámetro$$
  - $$Valor$$
* - $$m$$
  - $$43~[grs]$$
* - $$b$$
  - $$0.0015~[Ns/m]$$
* - $$k$$  
  - $$4.3~[N/m]$$ 
* - $$f(t)$$ 
  - $$0~[N]$$
```
Dado que se tiene una ecuación diferencial de segundo orden, es de gran utilidad recurrir a la representación en espacio de estados para obtener:

```{math}
:label: MBKeq3
\begin{eqnarray}
	\dot{x}_{1}&=x_{2}\\ 
    &\dot{x}_{2}=-\frac{b}{b}x_{2}-\frac{k}{m}x_{1}
	\end{eqnarray}
```
Con $x_{1}=x(t)$ la posición y $x_2=\dot{x}_{1}$ la velocidad instantáneas de la masa o del juguete de madera de nuestro ejemplo.

```{figure} /images/Imagen18.png
:height: 250px
:name: MBKfig2
```
Una forma para el método de Runge-Kutta de segundo orden, para el sistema masa resorte amortiguador es:

```{math}
:label: MBKeq4
\begin{eqnarray}
	x_{1_{i+1}}&=x_{1_{i+1}}+h\left( \frac{1}{2}k_{11}+\frac{1}{2}k_{12} \right)\\
    x_{2_{i+1}}&=x_{2_{i}}+h\left(\frac{1}{2}k_{21}+\frac{1}{2}k_{22} \right)
	\end{eqnarray}
```
con:

```{math}
:label: MBKeq5
\begin{eqnarray}
	&k_{12}=-\frac{b}{m}x_{2_{i}}-\frac{k}{m}x_{1_{i}}\\
    &k_{11}=x_{2_{i}}\\
    k_{22}&=-\frac{b}{m}(x_{2_{i}}+hk_{11})-\frac{k}{m}(x_{1_{i}}+hk_{12})\\
    &k_{21}=x_{2_{i}}+hk_{11})
	\end{eqnarray}
```

```{figure} /images/Imagen20.png
:height: 250px
:name: MBKfig3
```

## Conexiones físicas del sensor y la tarjeta Arduino Due

La conexión del sensor de aceleración y la tarjeta arduino se muestra a continuación. El sensor de aceleración se une al juguete de madera usando un tornillo y un imán de neodimio.

```{figure} /images/Imagen17.png
:height: 350px
:name: MBKfig4
```