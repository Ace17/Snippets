interface Plugin
{
  void decode();
}

alias Plugin function() PluginCreationFunction;

void registerPlugin(PluginType)(string name)
{
  static Plugin create()
  {
    return new PluginType;
  }
  g_Plugins[name] = &create;
}

string[] getAllPluginNames()
{
  return g_Plugins.keys;
}

Plugin createPlugin(string name)
{
  if(name !in g_Plugins)
    throw new Exception("Unknown plugin: '" ~ name ~ "'");

  return g_Plugins[name]();
}

private:

PluginCreationFunction[string] g_Plugins;

