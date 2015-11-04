import std.stdio;
import plugin;

class PluginVp9 : Plugin
{
  this()
  {
    writefln("Create VP9");
  }
  void decode()
  {
    writefln("Decode VP9");
  }
}

static this()
{
  registerPlugin!PluginVp9("vp9");
}

