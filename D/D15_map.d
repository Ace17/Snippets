#!dmd -run
import std.stdio;
import std.conv;

void main()
{
  int[string] peopleAges;
  peopleAges["SebA"] = 27;
  peopleAges["Matthieu"] = 25;
  peopleAges["RemyF"] = 26;

  foreach(name, age; peopleAges)
  {
    writefln("%s is %s years old", name, age);
  }

  if(("Gerard" in peopleAges) == null)
  {
    writefln("Gerard is not in my map");
  }

  writefln("There are %s entries in my map", peopleAges.length);
  peopleAges.clear;
  writefln("There are %s entries in my map", peopleAges.length);
}


