#!dmd -run
import std.variant;
import std.stdio;
import std.conv;

alias Algebraic!(int, float, string) Type;

int main()
{
  Type e;

  e = "hello";
  print(e);

  e = 7;
  print(e);

  return 0;
}

void print(Type val)
{
  string result = val.visit!(
      (int i) => to!string(0),
      (float f) => to!string(f),
      (string s) => quote(s)
      )();

  writefln("Val=%s", result);
}

string quote(string s)
{
  return "\"" ~ s ~ "\"";
}
