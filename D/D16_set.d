#!dmd -run
import std.stdio;
import std.container;

void main()
{
  auto team = new RedBlackTree!string; // RedBlackTree is the standard 'set'
  team.insert("SebA");
  team.insert("FredB");
  team.insert("MatthieuV");

  writeln("TEAM:");
  foreach(name; team)
    writefln("Team member: %s", name);

  team.insert("Julien");

  writeln("TEAM:");
  foreach(name; team)
    writefln("Team member: %s", name);

  if("Julien" in team)
  {
    writefln("Julien belongs to the team");
  }

  team.removeKey("Julien");

  if(!("Julien" in team))
  {
    writefln("Julien does not belong to the team anymore");
  }

  team.clear();

}


