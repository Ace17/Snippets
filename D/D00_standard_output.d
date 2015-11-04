#!dmd -run
import std.stdio;
import std.conv;

enum COLOR
{
  RED,
  GREEN,
  BLUE,
}

struct Structure
{
  int a, b, c;
}

void main()
{
  writefln("myValue = %s", 3); // integer
  writefln("myValue = %s", 3.4f); // float
  writefln("myValue = %s", "a string"); // string

  COLOR c = COLOR.RED;
  writefln("myValue = %s", c);  // an enum

  auto myArray = [1, 2, 3, 4, 5];
  writefln("myArray = %s", myArray); // an array

  auto myStruct = Structure(1, 2, 3);
  writefln("myStruct = %s", myStruct);

  // other functions:
  // writef: same as writefln without the new line

  // write, writeln: use without a format string
  writeln("This sentence contains the % character", " ", "and it is not a format specifier");
}


