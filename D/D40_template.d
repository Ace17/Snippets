#!dmd -run
import std.stdio;
import std.conv;

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

    string toString() const
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

template MyTemplatedMin(T)
{
  T MyTemplatedMin(T a, T b)
  {
    return a < b ? a : b;
  }
}

void main()
{
  auto v = new Vector!(int);
  v.push_back(9);
  v.push_back(10);

  writefln("v=%s", v);

  // implicit template function parameters
  auto m = MyTemplatedMin(4, 5);
  writefln("min=%s", m);

  // explicit template parameters: force float
  auto m2 = MyTemplatedMin!(float)(4, 3.3f);
  writefln("fmin=%s", m2);
}
