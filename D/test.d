#!dmd -run
import std.stdio;
import std.conv;

void LogPrint(T...)(int iLogLevel, string fmt, T args)
{
  // if(iLogLevel > g_LogLevel)
  write("LOG: ");
  writefln(fmt, args);
}

class Vector(T)
{
  public:
    this(size_t size=0)
    {
      m_Data.length = size;
    }

    void push_back(T val)
    {
      m_Data ~= val;
    }

    override string toString() const
    {
      string s;
      s ~= "[";
      foreach(i, element; m_Data)
      {
        if(i > 0)
          s ~= ", ";
        s ~= std.string.format("%s", element);
      }
      s ~= "]";
      return s;
    }

  private:
    T[] m_Data;
}

void main()
{
  immutable myArray = [ "a", "b", "c" ];

  writefln("myArray = %s", myArray);

  LogPrint(45, "myArray = %s", myArray);

  int[] tab;

  tab ~= 1;
  tab ~= 2;
  tab ~= 4;
  tab ~= 5;
  tab ~= 6;
  tab ~= 7;

  writefln("tab=%s", tab[0..$]);

  auto v = new Vector!int;
  v.push_back(9);
  v.push_back(10);

  immutable a = to!int("45");
  writefln("a=%s", a);

  writefln("v=%s", v);
}
