#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mkl.h>

int main() {
    int m = 2; 
    int n = 2; 
    int k = 2; 

    double alpha = 1.0;
    double beta = 0.0;

    double A[4] = {1.0, 2.0, 
                   3.0, 4.0};

    double B[4] = {5.0, 6.0, 
                   7.0, 8.0};

    double C[4] = {0.0, 0.0, 
                   0.0, 0.0};

    double expected[4] = {19.0, 22.0, 
                          43.0, 50.0};

    int lda = 2;
    int ldb = 2;
    int ldc = 2;

    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 
                m, n, k, alpha, A, lda, B, ldb, beta, C, ldc);

    double epsilon = 1e-9;

    for (int i = 0; i < m * n; i++) {
        if (fabs(C[i] - expected[i]) > epsilon) {
            printf("Error at index %d! Expected: %f, Got: %f\n", i, expected[i], C[i]);
            return EXIT_FAILURE;
        }
    }
    printf("TEST PASSED!\n");
    return EXIT_SUCCESS;
}
