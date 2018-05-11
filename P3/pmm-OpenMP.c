#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char const *argv[]) {
  if (argc < 2) {
      printf("./pmm-OpenMP <tamaño>\n");
      return -1;
  }

  int tamanio = atoi(argv[1]);
  int **matriz_1, **matriz_2, **matriz_resultado;
  double inicio, final, total;

  matriz_1 = (int**) malloc(tamanio*sizeof(int*));
  matriz_2 = (int**) malloc(tamanio*sizeof(int*));
  matriz_resultado = (int**) malloc(tamanio*sizeof(int*));

  if ((matriz_1 == NULL) || (matriz_2 == NULL) || (matriz_resultado == NULL)) {
    printf("No se ha podido reservar la memoria para la matriz");
    return -1;
  }

  for (int i = 0; i < tamanio; i++) {
    matriz_1[i] = (int*) malloc(tamanio*sizeof(int));
    if (matriz_1[i] == NULL){
      printf("No se ha podido reservar la memoria para la matriz");
      return -1;
    }
  }

  for (int i = 0; i < tamanio; i++) {
    matriz_2[i] = (int*) malloc(tamanio*sizeof(int));
    if (matriz_2[i] == NULL) {
      printf("No se ha podido reservar la memoria para la matriz");
      return -1;
    }
  }

  for (int i = 0; i < tamanio; i++) {
    matriz_resultado[i] = (int*) malloc(tamanio*sizeof(int));
    if (matriz_resultado[i] == NULL) {
      printf("No se ha podido reservar la memoria para la matriz");
      return -1;
    }
  }

  int j, k;
  #pragma omp parallel for private(j)
  for (int i = 0; i < tamanio; i++) {
    for (j = 0; j < tamanio; j++) {
      matriz_1[i][j] = 1;
      matriz_2[i][j] = 2;
      matriz_resultado[i][j] = 0;
    }
  }

  inicio = omp_get_wtime();

  #pragma omp parallel for private(j,k)
  for (int i = 0; i < tamanio; i++){
    for (j = 0; j < tamanio; j++){
      for (k = 0; k < tamanio; k++){
        matriz_resultado[i][j] += matriz_1[i][k] * matriz_2[k][j];
      }
    }
  }

  final = omp_get_wtime();
  total = final - inicio;

  printf("Resultado:\n" );
  printf("%d, %d\n", matriz_resultado[0][0], matriz_resultado[tamanio-1][tamanio-1]);
  printf("Tiempo: %f\n", total);

  return 0;
}
