#include <iostream>
#include <tbb/tbb.h>

int main()
{
  int n = 101;
  int ref = n * (n - 1) / 2;
  int sum = oneapi::tbb::parallel_reduce(
    oneapi::tbb::blocked_range<int>(1, n),
    0,
    [](oneapi::tbb::blocked_range<int> const& r, int init) -> int {
      for (int v = r.begin(); v != r.end(); v++  ) {
         init += v;
      }
      return init;
    },
    [](int lhs, int rhs) -> int {
      return lhs + rhs;
    }
  );
  if(sum == ref){
    std::cout << "TESTS PASSED!" << std::endl;
    return 0;
  }else{
    std::cout << "Mismatch found " << sum << " " << ref << std::endl;
    return 1;
  }
}
