#!dmd -run
import std.stdio;
import std.conv;

void MyPrintf(T...)(int iLogLevel, string fmt, T args)
{
  if(iLogLevel > 10)
  {
    write("LOG: ");
    writefln(fmt, args);
  }
}

void main()
{
  immutable myArray = [ "a", "b", "c" ];
  writefln("myArray = %s", myArray);

  MyPrintf(45, "myArray = %s", myArray);
}
