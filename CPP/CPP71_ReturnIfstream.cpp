#include <fstream>
#include <iostream>
#include <string>
#include <stdexcept>

using namespace std;

ifstream safeOpen(string path)
{
  ifstream fp(path);
  if(!fp.is_open())
    throw runtime_error("Can't open file");

  return fp;
}

int main()
{
  try
  {
    auto f = safeOpen("HelloFile");
    int val;
    f >> val;
  }
  catch(exception const& e)
  {
    cerr << "Fatal: " << e.what() << endl;
  }

  return 0;
}
