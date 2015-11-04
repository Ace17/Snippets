#include <cassert>

///////////////////////////////////////////////////////////////////////////////
// simple struct templated by a type
///////////////////////////////////////////////////////////////////////////////

template<typename T>
struct Array
{
public:
  Array(int size)
  {
    data = new T[size];
  }

  ~Array()
  {
    delete [] data;
  }

  void setAt(int idx, T const& val)
  {
    data[idx] = val;
  }

  T getAt(int idx) const
  {
    return data[idx];
  }

private:
  T* data;
};

void f()
{
  Array<int> tab(128);
  for(int i=0;i < 128; ++i)
    tab.setAt(i, 7);

  int a = tab.getAt(100);
}

///////////////////////////////////////////////////////////////////////////////
// simple function templated by a type
///////////////////////////////////////////////////////////////////////////////

template<typename NumberType>
NumberType square(NumberType val)
{
  return val * val;
}

///////////////////////////////////////////////////////////////////////////////
// simple function templated by a constant value
///////////////////////////////////////////////////////////////////////////////

template<int factor>
int multiplyBy(int number)
{
  return number * factor;
}

void g()
{
  int product = multiplyBy<4>(7);
  assert(product == 28);
}


