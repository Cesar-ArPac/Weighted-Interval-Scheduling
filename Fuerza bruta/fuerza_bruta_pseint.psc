Proceso WeightedInterval_FuerzaBruta
	
    Definir n, i, j, mascara, bit, aux Como Entero
    Definir ultimoFin, ganancia, mejor Como Real
    Definir inicio, horaFin, beneficio Como Entero
    Definir compatible Como Logico
	
    Dimension inicio[100]
    Dimension horaFin[100]
    Dimension beneficio[100]
	
    Escribir "Cantidad de actividades:"
    Leer n
	
    Para i <- 1 Hasta n Hacer
        Escribir "Actividad ", i
        Escribir "Inicio:"
        Leer inicio[i]
        Escribir "Final:"
        Leer horaFin[i]
        Escribir "Beneficio:"
        Leer beneficio[i]
    FinPara
	
    // Ordenar por hora de finalizacion.
	
    Para i <- 1 Hasta n-1 Hacer
        Para j <- 1 Hasta n-i Hacer
            Si horaFin[j] > horaFin[j+1] Entonces
				
				// Intercambiar hora de finalizacion
				aux <- horaFin[j]
				horaFin[j] <- horaFin[j+1]
				horaFin[j+1] <- aux
				
				// Intercambiar hora de inicio
				aux <- inicio[j]
				inicio[j] <- inicio[j+1]
				inicio[j+1] <- aux
				
				// Intercambiar beneficio
				aux <- beneficio[j]
				beneficio[j] <- beneficio[j+1]
				beneficio[j+1] <- aux
				
            FinSi
        FinPara
    FinPara
	
    mejor <- 0
	
    // Explorar todos los subconjuntos.
	
    Para mascara <- 0 Hasta (2^n)-1 Hacer
		
        ganancia <- 0
        ultimoFin <- -1
        compatible <- Verdadero
		
        Para i <- 1 Hasta n Hacer
			
            bit <- Trunc(mascara / (2^(i-1))) MOD 2
			
            Si bit = 1 Entonces
				
                Si inicio[i] >= ultimoFin Entonces
                    ganancia <- ganancia + beneficio[i]
                    ultimoFin <- horaFin[i]
                SiNo
                    compatible <- Falso
                FinSi
				
            FinSi
			
        FinPara
		
        Si compatible Y ganancia > mejor Entonces
            mejor <- ganancia
        FinSi
		
    FinPara
	
    Escribir "Beneficio maximo: ", mejor
	
FinProceso