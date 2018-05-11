#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
  if (argc < 2){
      printf("./pmtv-secuencial <tamaño>\n");
      return -1;
  }

  int tamanio = atoi(argv[1]);
  int *vector, *vector_resultado, **matriz;

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

  if (tamanio < 10) {
    for (int i = 0; i < tamanio; i++) {
      for (int j = 0; j < tamanio; j++) {
        printf("%d ", matriz[i][j]);
      }
      printf("\n");
    }
  }

  for (int i = 0; i < tamanio; i++) {
    for (int j = 0; j <= i; j++){
      vector_resultado[i] += matriz[i][j] * vector[j];
    }
  }

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
  return 0;
}
