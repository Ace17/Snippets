#!dmd -run
import std.variant;
import std.stdio;
import std.conv;


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

//-----------------------------------------------------------------------------
// Custom expression-specific union
//-----------------------------------------------------------------------------

struct Expr
{
  this(Number n)
  {
    m_Type = TYPE.NUM;
    num = n;
  }

  this(Addition a)
  {
    m_Type = TYPE.ADD;
    add = a;
  }

  this(Multiplication m)
  {
    m_Type = TYPE.ADD;
    mul = m;
  }

  auto visit(alias fAdd, alias fMul, alias fNum)()
  {
    final switch(m_Type)
    {
      case TYPE.ADD: return fAdd(add);
      case TYPE.MUL: return fMul(mul);
      case TYPE.NUM: return fNum(num);
    }
  }

private:
  union
  {
    Addition add;
    Multiplication mul;
    Number num;
  }

  enum TYPE
  {
      ADD,
      MUL,
      NUM,
  };

  TYPE m_Type;
}

