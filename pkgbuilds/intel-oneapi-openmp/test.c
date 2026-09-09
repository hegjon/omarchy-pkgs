#include <stdio.h>
#include <stdlib.h>

#define ARRAYLEN 1024

int main()
{
  int ref = ARRAYLEN * (ARRAYLEN - 1) / 2;
  int a[ARRAYLEN];
  for(int i = 0; i < ARRAYLEN; i++){
    a[i] = i;
  }

  int sum = 0;

  #pragma omp map(sum) map(to: a[:ARRAYLEN])
  #pragma omp teams distribute reduction(+:sum)
  for(int i = 0; i < ARRAYLEN; i++){
    sum += a[i];
  }
  if(sum == ref){
    printf("TESTS PASSED!\n");
    return EXIT_SUCCESS;
  }else{
    printf("Mismatch: %d and %d\n", ref, sum);
    return EXIT_FAILURE;
  }
}
