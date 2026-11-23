
def fuerza_bruta(actividades):
    actividades = sorted(actividades, key=lambda x: x[1])
    mejor_beneficio = 0
    mejor_seleccion = []
    operaciones = 0

    def explorar(i, beneficio_actual, seleccion, ultimo_fin):
        nonlocal mejor_beneficio, mejor_seleccion, operaciones
        operaciones += 1  

        if i == len(actividades):
            if beneficio_actual > mejor_beneficio:
                mejor_beneficio = beneficio_actual
                mejor_seleccion = seleccion.copy()
            return

      
        explorar(i + 1, beneficio_actual, seleccion, ultimo_fin)

      
        inicio, fin, ganancia = actividades[i]
        if inicio >= ultimo_fin:
            seleccion.append((inicio, fin, ganancia))
            explorar(i + 1, beneficio_actual + ganancia, seleccion, fin)
            seleccion.pop()

    explorar(0, 0, [], float("-inf"))
    return mejor_beneficio, mejor_seleccion, operaciones


if __name__ == "__main__":
    actividades = [
        (1, 3, 50), (2, 5, 100), (4, 6, 70),
        (6, 8, 60), (5, 9, 150), (8, 10, 80)
    ]
    beneficio, seleccion, operaciones = fuerza_bruta(actividades)
    print("Beneficio maximo:", beneficio)
    print("Actividades seleccionadas:", seleccion)
    print("Estados explorados:", operaciones)
