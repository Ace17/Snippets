#!dmd -run
import std.file;
import std.stdio;

int main()
{
  auto f = File("D20_read_text_file.d", "r");
  auto lines = f.byLine();

  foreach(line; lines)
  {
    writeln("Line: ", line);
  }

  return 0;
}

