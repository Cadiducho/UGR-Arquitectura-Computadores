#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char const *argv[]) {
  if (argc < 2){
      printf("./pmm-secuencial <tamaño>\n");
      return -1;
  }

  int tamanio = atoi(argv[1]);
  int **matriz_1, **matriz_2, **matriz_resultado;

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

  for (int i = 0; i < tamanio; i++) {
    for (int j = 0; j < tamanio; j++) {
      matriz_1[i][j] = 1;
      matriz_2[i][j] = 2;
      matriz_resultado[i][j] = 0;
    }
  }

  for (int i = 0; i < tamanio; i++){
    for (int j = 0; j < tamanio; j++){
      for (int k = 0; k < tamanio; k++){
        matriz_resultado[i][j] += matriz_1[i][k] * matriz_2[k][j];
      }
    }
  }

  printf("Resultado:\n" );
  printf("%d, %d\n", matriz_resultado[0][0], matriz_resultado[tamanio-1][tamanio-1]);

  return 0;
}
