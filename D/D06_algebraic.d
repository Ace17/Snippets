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

class Number
{
  this(int v)
  {
    value = v;
  }

  int value;
}

alias Algebraic!(Addition, Number) Expr;

int main()
{

  auto e1 = Expr(new Number(7));
  auto e2 = Expr(new Number(8));
  auto e = Expr(new Addition(e1, e2));

  writefln("eval: %s", eval(e));

  return 0;
}

int eval(Expr val)
{
  return val.visit!(
      (Addition addition) => eval(addition.a) + eval(addition.b),
      (Number number) => number.value
      )();
}

