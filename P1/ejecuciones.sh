
for T in 1 2 3; do
	echo ""
	echo "*============*"
	echo ""
	filename=""
	if [ $T -eq 1 ]; then
		filename="SumaVectoresC"
	elif [ $T -eq 2 ]; then
		filename="SumaVectoresCParallelFor"
	else
		filename="SumaVectoresCParallelSections"
	fi
	echo "Ejecuciones " $filename


	for N in 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216 33554432 67108864; do
		echo "Tamaño: " $N
		./$filename $N
		echo "-------"
	done
	echo "Fin de " $filename
	echo "*============*"
	echo ""
done
