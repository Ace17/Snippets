// How to _quickly_ modify an existing program to add an execution trace

#include <fstream>

int main()
{
  {
    // open a binary file for reading
    std::ifstream fp("test.dat", std::ios::binary);

    // read bytes
    char buffer[256];
    fp.read(buffer, 256);

    // the file is automatically closed at the end of scope.
    // no need to call 'close'.
  }

  {
    // open a text file for writing
    std::ofstream fp("trace.txt");

    // write one line
    fp << "Hello, world" << std::endl;
  }

  {
    // open a text file for writing
    std::ofstream fp("trace.txt");

    // write one line
    fp << "Hello, world" << std::endl;

    fp.flush(); // ensure all pending data gets written to disk

    assert(false); // crash, before reaching the end of scope

    fp << "Hello, crash" << std::endl; // never reached
  }

  {
    // how to load a binary file into memory
    std::ifstream fp("test.dat", std::ios::binary);

    fp.seekg(0, std::ios::end); // go to the end of file
    auto const size = fp.tellg();
    fp.seekg(0); // rewind to the beginning of the file

    // allocate a file-sized buffer
    std::vector<unsigned char> buffer(size);

    // load the file
    fp.read(buffer.data(), buffer.size());
  }

  return 0;
}

