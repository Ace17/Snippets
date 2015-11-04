#!dmd -run
import std.stdio;

void main(string[] args)
{
  auto f = File("test.txt", "w"); // open for writing
  f.write("Hello");
  {
    auto g = f; // now g and f write to the same file
    // internal reference count is 2
    g.write(", ", "world");
    // g exits scope, reference count decreases to 1
  }
  f.writeln("!");
  // f exits scope, reference count falls to zero,
  // file is closed.
}

