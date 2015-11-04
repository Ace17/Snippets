import std.string;
import std.stdio;

class Either(Types...)
{
  mixin(DeclareEnum!Types);

  Tag m_tag;

  mixin(DeclareUnion!Types);
  mixin(DeclareConstructors!Types);

  mixin(DeclareVisit!Types);
}

string DeclareEnum(Types...)()
{
  string r;
  r ~= "enum Tag";
  r ~= "{";
  foreach(i, T; Types)
    r ~= format("T%s,", T.stringof);
  r ~= "}";
  return r;
}

string DeclareUnion(Types...)()
{
  string r;
  r ~= "union";
  r ~= "{";
  foreach(i, T; Types)
    r ~= format("%s m_v%s;", T.stringof, i);
  r ~= "}";
  return r;
}

string DeclareConstructors(Types...)()
{
  string r;
  foreach(i, T; Types)
    r ~= format("this(%s val) { m_tag = Tag.T%s; m_v%s = val; }", T.stringof, T.stringof, i);
  return r;
}

string DeclareVisit(Types...)()
{
  string r;
  r ~= "U visit(U)";

  // argument list
  r ~= "(";
  foreach(i, T; Types)
  {
    if(i > 0)
      r ~= ", ";
    r ~= format("U delegate(Types[%s]) f%s", i, i);
  }
  r ~= ")";

  // function body
  r ~= "{";
  r ~= "  final switch(m_tag)";
  r ~= "  {";
  foreach(i, T; Types)
    r ~= format("case Tag.T%s: return f%s(m_v%s);", T.stringof, i, i);
  r ~= "  }";
  r ~= "}";

  return r;
}

alias Either!(int, string) Expr;

int main()
{
  Expr expr;

  int onInt(int val)
  {
    writefln("int");
    return 0;
  }

  int onString(string val)
  {
    writefln("string");
    return 0;
  }

  expr = new Expr(1);
  expr.visit!int(&onInt, &onString);

  expr = new Expr("hello");
  expr.visit!int(&onInt, &onString);

  return 0;
}

