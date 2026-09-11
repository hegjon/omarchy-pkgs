#include <iostream>
#include <cmath>
#include <sycl/sycl.hpp>
#include <oneapi/mkl.hpp>

int main() {
    int m = 2; 
    int n = 2; 
    int k = 2; 

    float alpha = 1.0f;
    float beta = 0.0f;

    int lda = 2;
    int ldb = 2;
    int ldc = 2;

    sycl::queue q(sycl::default_selector_v);
    
    std::cout << "Running on device: " 
              << q.get_device().get_info<sycl::info::device::name>() 
              << std::endl;

    float* A = sycl::malloc_shared<float>(m * k, q);
    float* B = sycl::malloc_shared<float>(k * n, q);
    float* C = sycl::malloc_shared<float>(m * n, q);

    // Initialize the matrices (Row-Major format)
    A[0] = 1.0f; A[1] = 2.0f; 
    A[2] = 3.0f; A[3] = 4.0f;

    B[0] = 5.0f; B[1] = 6.0f; 
    B[2] = 7.0f; B[3] = 8.0f;

    C[0] = 0.0f; C[1] = 0.0f; 
    C[2] = 0.0f; C[3] = 0.0f;

    // Expected result matrix
    float expected[4] = {19.0, 22.0, 
                          43.0, 50.0};

    try {
        auto event = oneapi::mkl::blas::row_major::gemm(
            q, 
            oneapi::mkl::transpose::nontrans, 
            oneapi::mkl::transpose::nontrans, 
            m, n, k, 
            alpha, 
            A, lda, 
            B, ldb, 
            beta, 
            C, ldc
        );
        event.wait();
        
    } catch (sycl::exception const& e) {
        std::cerr << "SYCL exception caught: " << e.what() << std::endl;
        sycl::free(A, q); sycl::free(B, q); sycl::free(C, q);
        return 1;
    }

    // Check the entries for correctness
    float epsilon = 1e-4f;

    for (int i = 0; i < m * n; i++) {
        if (std::fabs(C[i] - expected[i]) > epsilon) {
            std::cerr << "Error at index " << i << "! Expected: " 
                      << expected[i] << ", Got: " << C[i] << std::endl;
            return -1;
        }
    }

    // Free the USM allocations
    sycl::free(A, q);
    sycl::free(B, q);
    sycl::free(C, q);

    std::cout << "TESTS PASSED" << std::endl;
    return 0;
}
