#Reference: http://blog.espol.edu.ec/analisisnumerico/sistemas-edo-modelo-predador-presa/

# Modelo predador-presa de Lotka-Volterra
# Sistemas EDO con Runge Kutta de 2do Orden
import numpy as np

def rungekutta2_fg(f,g,t0,x0,y0,h,muestras):
    tamano = muestras +1
    tabla = np.zeros(shape=(tamano,3),dtype=float)
    tabla[0] = [t0,x0,y0]
    ti = t0
    xi = x0
    yi = y0
    for i in range(1,tamano,1):
        K1x = h * f(ti,xi,yi)
        K1y = h * g(ti,xi,yi)
        
        K2x = h * f(ti+h, xi + K1x, yi+K1y)
        K2y = h * g(ti+h, xi + K1x, yi+K1y)

        xi = xi + (1/2)*(K1x+K2x)
        yi = yi + (1/2)*(K1y+K2y)
        ti = ti + h
        
        tabla[i] = [ti,xi,yi]
    tabla = np.array(tabla)
    return(tabla)

# PROGRAMA ------------------

# Doc Variables
# x = nro de presas
# y = nro de depredadores
# t = tiempo de observacion

# a = razon de crecimiento de la presas
# c = razon de muerte del depredadores
# b = efecto de la interacción depredador-presa sobre la muerte de la presa(0.7)
# d = efecto de la interaccion depresador-presa sobre el crecimiento del
# depredador (0.35)

# INGRESO
# Parámetros de las ecuaciones
a = 0.5
b = 0.7
c = 0.35
d = 0.35

# Ecuaciones
f = lambda t,x,y : a*x -b*x*y
g = lambda t,x,y : -c*y + d*x*y

# Condiciones iniciales
t0 = 0
x0 = 2
y0 = 1

# parámetros del algoritmo
h = 0.5
muestras = 101

# PROCEDIMIENTO
tabla = rungekutta2_fg(f,g,t0,x0,y0,h,muestras)
ti = tabla[:,0]
xi = tabla[:,1]
yi = tabla[:,2]

# SALIDA
np.set_printoptions(precision=6)
print(' [ ti, xi, yi]')
print(tabla)
