
#!/bin/bash
#Modificado para local

for ((N=65536;N<67108865;N=N*2))
do
./SumaVectoresDyn $N
done
