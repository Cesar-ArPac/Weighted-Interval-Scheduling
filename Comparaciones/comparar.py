

from random import Random
from time import perf_counter
from fuerza_bruta import fuerza_bruta
from programacion_dinamica import programacion_dinamica

def generar_actividades(n, semilla=2026):
    rng = Random(semilla + n)
    actividades = []
    for _ in range(n):
        inicio = rng.randint(0, 3 * n)
        duracion = rng.randint(1, max(2, n // 3))
        fin = inicio + duracion
        beneficio = rng.randint(10, 200)
        actividades.append((inicio, fin, beneficio))
    return actividades

for n in (10, 20):
    datos = generar_actividades(n)

    t0 = perf_counter()
    r_fb = fuerza_bruta(datos)
    t_fb = perf_counter() - t0

    t0 = perf_counter()
    r_dp = programacion_dinamica(datos)
    t_dp = perf_counter() - t0

    print(f"\nESCENARIO: {n} actividades")
    print(f"Fuerza bruta: beneficio={r_fb[0]}, operaciones={r_fb[2]}, tiempo={t_fb:.6f} s")
    print(f"Programacion dinamica: beneficio={r_dp[0]}, operaciones={r_dp[2]}, tiempo={t_dp:.6f} s")
    print("Resultados iguales:", r_fb[0] == r_dp[0])
