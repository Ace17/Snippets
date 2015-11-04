#include <fstream>
#include <string>
#include <stdexcept>
using namespace std;

ifstream openInput(string filename)
{
  ifstream fp(filename, ios::binary);
  if(fp.is_open())
    throw runtime_error("Can't open '" + filename + "'");

  return fp;
}

int main()
{
  auto fp = openInput("/dev/urandom");
  return 0;
}


