import std.stdio;
import plugin;

class PluginHevc : Plugin
{
  this()
  {
    writefln("Create HEVC");
  }
  void decode()
  {
    writefln("Decode HEVC");
  }
}

static this()
{
  registerPlugin!PluginHevc("hevc");
}
