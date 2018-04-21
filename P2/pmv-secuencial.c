
#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif

int main(int argc, char const *argv[]) {

  if (argc < 2){
    printf("ERROR: argumentos incorrectos. Modo de uso: ./pmv-secuencial <tamaño de matriz y vector>");
    return -1;
  }

  double tiempo_inicio, tiempo_final, tiempo_total;
  int size = atoi(argv[1]);

  double *vector, *vector_resultado, **matriz;

  vector = (double*) malloc(size*sizeof(double));
  vector_resultado = (double*) malloc(size*sizeof(double));
  matriz = (double**) malloc(size*sizeof(double*));

  if ( (vector == NULL) || (vector_resultado == NULL) || (matriz == NULL)){
    printf("Error en la reserva de memoria");
    return -1;
  }

  for (int i = 0; i < size; i++){
    matriz[i] = (double*) malloc(size*sizeof(double));
    if (matriz[i] == NULL){
      printf("Error en la reserva de memoria para matriz");
      return -1;
    }
  }

  for (int i = 0; i < size; i++){
    vector[i] = i;
    vector_resultado[i] = 0;
    for (int j = 0; j < size; j++)
      matriz[i][j] = i+j;
  }

  tiempo_inicio = omp_get_wtime();

  for (int i = 0; i < size; i++){
    for (int j = 0; j < size; j++){
      vector_resultado[i] += matriz[i][j]*vector[j];
    }
  }

  tiempo_final = omp_get_wtime();
  tiempo_total = tiempo_final - tiempo_inicio;

  printf("Tiempo: %f s. Tamaño: %d. 1 comp: %f. Ult. comp: %f\n",tiempo_total, size, vector_resultado[0], vector_resultado[size-1]);

  if (size < 15){
    for (int i = 0; i < size; i++)
      printf("vector resultado[%d]=%f \n", i, vector_resultado[i]);
  }

  free(vector);
  free(vector_resultado);

  for(i=0; i < size; ++i)
    free(matriz[i]);

  free(matriz);

  return 0;
}
