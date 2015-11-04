#!dmd -run
import std.file;
import std.stdio;

int main()
{
  auto files = dirEntries("C:\\Windows", SpanMode.depth);
  foreach (name; files)
  {
    writefln("File: %s", name);
  }

  return 0;
}

