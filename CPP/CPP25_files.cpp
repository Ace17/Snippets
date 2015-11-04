// How to _quickly_ modify an existing program to add an execution trace

#include <iostream>

// complicated function with an error
int sumOfSquares(int* numbers, int size)
{
  int sum;

  for(int i=0;i < size; ++i)
    sum += numbers[i] * numbers[i];

  return sum;
}

int main()
{
  int numbers[] = { 4, -25, 64, 7 };
  std::cout << "The sum is: " << sumOfSquares(numbers, 4) << std::endl;
  return 0;
}

///////////////////////////////////////////////////////////////////////////////
// Now, the instrumented version.
// There are 3 lines to add:
// 1: the include <fstream>
// 2: the opening of the file ('static' is important here!)
// 3: the trace itself
///////////////////////////////////////////////////////////////////////////////

/* 1/3 */ #include <fstream>

// complicated function with an error, instrumented version
int sumOfSquares(int* numbers, int size)
{
  int sum;

  for(int i=0;i < size; ++i)
  {
    sum += numbers[i] * numbers[i];

    /* 2/3 */ static std::ofstream fp("trace.txt");
    /* 3/3 */ fp << "sum=" << sum << ", i=" << i << std::endl;
  }

  return sum;
}

