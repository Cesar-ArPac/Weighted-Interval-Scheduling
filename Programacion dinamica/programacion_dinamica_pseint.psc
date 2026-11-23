Proceso WeightedInterval_ProgramacionDinamica
	
    Definir n, i, j, aux Como Entero
    Definir izquierda, derecha, medio, posicion Como Entero
    Definir inicio, horaFin, beneficio Como Entero
    Definir p, dp Como Entero
	
    Dimension inicio[100]
    Dimension horaFin[100]
    Dimension beneficio[100]
    Dimension p[100]
    Dimension dp[101]
	
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
	
    // Ordenar actividades por hora de finalizacion.
	
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
	
    // Caso base: cero actividades.
	
    dp[1] <- 0
	
    Para i <- 1 Hasta n Hacer
		
        // Buscar la ultima actividad compatible.
		
        izquierda <- 1
        derecha <- i-1
        posicion <- 0
		
        Mientras izquierda <= derecha Hacer
			
            medio <- Trunc((izquierda + derecha)/2)
			
            Si horaFin[medio] <= inicio[i] Entonces
				
                posicion <- medio
                izquierda <- medio+1
				
            SiNo
				
                derecha <- medio-1
				
            FinSi
			
        FinMientras
		
        p[i] <- posicion
		
        // Comparar tomar o no tomar la actividad.
		
        dp[i+1] <- dp[i]
		
        Si beneficio[i] + dp[p[i]+1] > dp[i+1] Entonces
			
            dp[i+1] <- beneficio[i] + dp[p[i]+1]
			
        FinSi
		
    FinPara
	
    Escribir "Beneficio maximo: ", dp[n+1]
	
FinProceso