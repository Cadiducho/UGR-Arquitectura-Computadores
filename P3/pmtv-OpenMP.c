#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char const *argv[]) {
  if (argc < 2){
      printf("./pmtv-OpenMP <tamaño>\n");
      return -1;
  }

  int tamanio = atoi(argv[1]);
  int *vector, *vector_resultado, **matriz;
  double inicio, final, total;

  vector = (int*) malloc(tamanio*sizeof(double));
  vector_resultado = (int*) malloc(tamanio*sizeof(double));
  matriz = (int**) malloc(tamanio*sizeof(double*));


  if ((vector == NULL) || (vector_resultado == NULL) || (matriz == NULL)) {
    printf("No se ha podido reservar la memoria para la matriz");
    return -1;
  }

  for (int i = 0; i < tamanio; i++) {
    matriz[i] = (int*) malloc(tamanio*sizeof(double));
    if (matriz[i] == NULL){
      printf("No se ha podido reservar la memoria para la matriz");
      return -1;
    }
  }

  for (int i = 0; i < tamanio; i++) {
    vector[i] = i;
    vector_resultado[i] = 0;
    for (int j = 0; j < tamanio; j++) {
      if (i >= j) {
        matriz[i][j] = i+j;
      } else {
        matriz[i][j] = 0;
      }
    }
  }

  if (tamanio < 5) {
    for (int i = 0; i < tamanio; i++) {
      for (int j = 0; j < tamanio; j++) {
        printf("%d ", matriz[i][j]);
      }
      printf("\n");
    }
  }

  inicio = omp_get_wtime();

  for (int i = 0; i < tamanio; i++) {
    int acumulador = 0;
    #pragma omp parallel for reduction(+:acumulador) schedule(runtime)
    for (int j = 0; j <= i; j++) {
      acumulador += matriz[i][j] * vector[j];
    }
    vector_resultado[i] += acumulador;
  }

  final = omp_get_wtime();

  total = final - inicio;

  int a;
  if (tamanio > 15) {
    a = tamanio - 1;
  } else {
    a = 1;
  }

  printf("Resultado:\n" );
  for (int i = 0; i < tamanio; i+=a) {
    printf("%d ",vector_resultado[i]);
  }
  printf("\n");
  printf("Tiempo: %f\n", total);
  return 0;
}
