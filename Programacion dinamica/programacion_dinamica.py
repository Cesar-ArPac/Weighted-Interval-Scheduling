

from bisect import bisect_right

def programacion_dinamica(actividades):
    actividades = sorted(actividades, key=lambda x: x[1])
    n = len(actividades)
    finales = [a[1] for a in actividades]

 
    p = [0] * (n + 1)
    comparaciones_busqueda = 0

    for i in range(1, n + 1):
        inicio_actual = actividades[i - 1][0]
        izquierda, derecha = 0, i - 1
        posicion = 0
        while izquierda <= derecha:
            medio = (izquierda + derecha) // 2
            comparaciones_busqueda += 1
            if finales[medio] <= inicio_actual:
                posicion = medio + 1
                izquierda = medio + 1
            else:
                derecha = medio - 1
        p[i] = posicion

   
    dp = [0] * (n + 1)
    decisiones = [False] * (n + 1)
    operaciones_dp = 0

    for i in range(1, n + 1):
        tomar = actividades[i - 1][2] + dp[p[i]]
        no_tomar = dp[i - 1]
        operaciones_dp += 1
        if tomar > no_tomar:
            dp[i] = tomar
            decisiones[i] = True
        else:
            dp[i] = no_tomar

 
    seleccion = []
    i = n
    while i > 0:
        if decisiones[i] and actividades[i - 1][2] + dp[p[i]] >= dp[i - 1]:
            seleccion.append(actividades[i - 1])
            i = p[i]
        else:
            i -= 1
    seleccion.reverse()

    operaciones = comparaciones_busqueda + operaciones_dp
    return dp[n], seleccion, operaciones


if __name__ == "__main__":
    actividades = [
        (1, 3, 50), (2, 5, 100), (4, 6, 70),
        (6, 8, 60), (5, 9, 150), (8, 10, 80)
    ]
    beneficio, seleccion, operaciones = programacion_dinamica(actividades)
    print("Beneficio maximo:", beneficio)
    print("Actividades seleccionadas:", seleccion)
    print("Comparaciones/operaciones contadas:", operaciones)
