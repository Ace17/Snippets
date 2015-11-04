#!dmd -run
import std.variant;
import std.stdio;
import std.conv;
import std.string;

//-----------------------------------------------------------------------------
// Custom expression-specific union
//-----------------------------------------------------------------------------

string createVisitFunction(immutable string[] names)
{
  string s;
  //--------------------------------
  // generate 'visit' function
  //--------------------------------

  s ~= "auto visit(";

  foreach(i, name; names)
  {
    if(i > 0)
      s ~= ", ";
    s ~= format("alias f%s", name);
  }
  s ~= "
    )
    ()
    {
      final switch(m_Type)
      {
        ";

        foreach(name; names)
        {
          s ~= "case Type."~ name ~ ":";
          s ~= " return f" ~ name ~ "(m_" ~ name ~ ");";
        }
   s ~= "
      }
    }
  ";

  return s;
}

string createConstructors(immutable string[] names)
{
  string s;
  foreach(name; names)
  {
    s ~=
      format(
          "this(%s n) "
          "{ "
          "  m_Type = Type.%s; "
          "  m_%s = n; "
          "} "
          , name, name, name);
  }
  return s;
}

string createInternalUnion(immutable string[] names)
{
  string s;
  s ~= " union { ";
  foreach(name; names)
  {
    s ~= name;
    s ~= " ";
    s ~= "m_" ~ name;
    s ~= ";";
  }
  s ~= "}";

  return s;
}

string createInternalEnum(immutable string[] names)
{
  string s;
  s ~= " enum Type { ";
  foreach(name; names)
  {
    s ~= name;
    s ~= ",";
  }
  s ~= " };";
  return s;
}

string CreateUnionType(immutable string[] names)
{
  string s;
  s ~= " struct Expr { ";

  s ~= createConstructors(names);
  s ~= createVisitFunction(names);

  s ~= "private:\n";

  s ~= createInternalUnion(names);
  s ~= createInternalEnum(names);

  s ~= " Type m_Type; } ";

  return s;
}

mixin(CreateUnionType([ "Addition", "Multiplication", "Number" ]));



class Addition
{
  this(Expr pa, Expr pb)
  {
    a = pa;
    b = pb;
  }

  Expr a, b;
}

class Multiplication
{
  this(Expr pa, Expr pb)
  {
    a = pa;
    b = pb;
  }

  Expr a, b;
}

class Number
{
  this(int v)
  {
    value = v;
  }

  int value;
}

int main()
{

  auto e1 = Expr(new Number(7));
  auto e2 = Expr(new Number(8));
  auto e3 = Expr(new Addition(e1, e2));

  auto e = Expr(new Multiplication(e3, e3));

  writefln("eval: %s", eval(e));

  return 0;
}

int eval(Expr val)
{
  return val.visit!(
      (Addition addition) => eval(addition.a) + eval(addition.b),
      (Multiplication mul) => eval(mul.a) * eval(mul.b),
      (Number number) => number.value
      )();
}

