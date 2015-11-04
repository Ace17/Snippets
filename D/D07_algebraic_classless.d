#!/usr/bin/env rdmd
import std.stdio;
import std.conv;

int main()
{
  auto e1 = makeNum(7);
  auto e2 = makeNum(8);
  auto e3 = makeAdd(e1, e2);

  auto e = makeMul(e3, e3);

  writefln("eval: %s", eval(e));

  static struct isNum
  {
    static bool visit(Number)
    {
      return true;
    }

    static bool visit(T...)(T other)
    {
      return false;
    }
  }

  writefln("isNum(e1): %s", e1.apply!isNum());
  writefln("isNum(e2): %s", e2.apply!isNum());
  writefln("isNum(e3): %s", e3.apply!isNum());

  return 0;
}

int eval(Expr* val)
{
  return val.apply!(
      (Addition add) => eval(add.a) + eval(add.b),
      (Multiplication mul) => eval(mul.a) * eval(mul.b),
      (Number num) => num.val
      )();
}

//-----------------------------------------------------------------------------
// Custom expression-specific union
//-----------------------------------------------------------------------------

struct Addition
{
  Expr* a;
  Expr* b;
}

struct Multiplication
{
  Expr* a;
  Expr* b;
}

struct Number
{
  int val;
}

static auto makeMul(Expr* a, Expr* b)
{
  auto e = new Expr;
  e.m_Type = Expr.TYPE.MUL;
  e.m_addition = Addition(a, b);
  return e;
}

static auto makeAdd(Expr* a, Expr* b)
{
  auto e = new Expr;
  e.m_Type = Expr.TYPE.ADD;
  e.m_multiplication = Multiplication(a, b);
  return e;
}

static auto makeNum(int val)
{
  auto e = new Expr;
  e.m_Type = Expr.TYPE.NUM;
  e.m_number = Number(val);
  return e;
}

struct Expr
{
  auto apply(Functions)()
  {
    final switch(m_Type)
    {
      case TYPE.ADD: return Functions.visit(m_addition);
      case TYPE.MUL: return Functions.visit(m_multiplication);
      case TYPE.NUM: return Functions.visit(m_number);
    }
  }

  auto apply(alias fAdd, alias fMul, alias fNum)()
  {
    final switch(m_Type)
    {
      case TYPE.ADD: return fAdd(m_addition);
      case TYPE.MUL: return fMul(m_multiplication);
      case TYPE.NUM: return fNum(m_number);
    }
  }

private:
  union
  {
    Addition m_addition;
    Multiplication m_multiplication;
    Number m_number;
  }

  enum TYPE
  {
      ADD,
      MUL,
      NUM,
  };

  TYPE m_Type;
}

