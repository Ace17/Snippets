#!/usr/bin/env rdmd
import std.stdio;
import std.traits;

int main()
{
  register!Process;

  return 0;
}

void register(alias F)()
{
  writefln("Function is '%s'", fullyQualifiedName!F );
  alias ParameterTypeTuple!F argTypes;
  auto argNames = [ ParameterIdentifierTuple!F ];

  foreach(i, arg; argTypes)
  {
    alias fullyQualifiedName!arg argType;
    writefln("%s: %s", argNames[i], argType);
  }
}

class Function
{
}

void Process(int a, int b)
{
}

