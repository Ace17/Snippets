#include <iostream>
using namespace std;

// raii_util.h

template<typename T>
struct ScopeExit
{
  ScopeExit(T f)
  {
    func = &f;
  }
  ~ScopeExit()
  {
    (*func)();
  }
  T* func;
};

  template<typename T>
ScopeExit<T> scopeExit(T func)
{
  return ScopeExit<T>(func);
}

//
// app code
//
void freeRessources()
{
  cerr << "Freeing ressources" << endl;
  cerr.flush();
}

void unsafeOperation()
{
  throw "error";
}

int main()
{
  try
  {
    auto scoped = scopeExit([&]() { freeRessources(); });
    unsafeOperation();
  }
  catch(...)
  {
    cerr << "Aborted" << endl;
  }
  return 0;
}

