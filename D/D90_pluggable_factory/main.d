import std.stdio;
import plugin;

int main()
{
  writefln("List of registered plugins:");
  foreach(name; getAllPluginNames())
  {
    writefln("* %s", name);
  }
  auto p = createPlugin("vp9");
  process(p);
  return 0;
}

void process(Plugin p)
{
  p.decode();
}

