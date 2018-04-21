
#!/bin/bash
#PBS -N EjecucionesPractica1
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
#Se ejecuta SumaVectorC, que está en el directorio en el que se ha ejecutado qsub,
#para N potencia de 2 desde 2^16 a 2^26

for T in 1 2; do
	echo ""
	echo "*============*"
	echo ""
	filename=""
	if [ $T -eq 1 ]; then
		filename="SumaVectoresC"
	elif [ $T -eq 2 ]; then
		filename="SumaVectoresCParallelFor"
	fi
	echo "Ejecuciones " $filename

	for N in 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216 33554432 67108864; do
		echo "Tamaño: " $N
		time $PBS_O_WORKDIR/SumaVectoresC $N
		echo "-------"
	done
	echo "Fin de " $filename
	echo "*============*"
	echo ""
done
