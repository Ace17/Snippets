#!dmd -run
import std.file;
import std.stdio;

int main()
{
  // open the file
  auto f = File("D21_read_binary_file.d");
  long total = 0;

  while(!f.eof())
  {
    ubyte[] readBuffer;
    readBuffer.length = 128;

    // try to read 128 bytes
    auto readData = f.rawRead(readBuffer);

    writefln("Read %d bytes", readData.length);
  }

  writefln("End of file");

  return 0;
}

