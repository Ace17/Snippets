#!dmd -run
import std.stdio;

int main(string[] args)
{
  foreach(i, arg; args)
    writefln("args[%s]=%s", i, arg);
  return 0;
}
