#!dmd -run
import std.stdio;

struct S
{
  int a;
  int b;
  int c;
}

interface IObject
{
  void g();
}

class Base
{
  this(int N)
  {
  }
}

class C : Base, IObject
{
  this()
  {
    super(5); // call base constructor
    writefln("Constructor: C");
  }

  ~this()
  {
    writefln("Destructor: C");
  }

  override void g() // override virtual function
  {
    writefln("C::g()");
  }

  int a, b, c;
}

struct AlignedArray(T)
{
  T* data;
  size_t len;
}

int main()
{
  //vector<uint8_t> buffer;

  AlignedArray!ubyte array;

  ubyte[] buffer;
  buffer ~= 1;
  buffer ~= 2;
  buffer ~= 4;
  buffer ~= 7;

  process(buffer[2..3]);

  string s = "yo";
  s ~= "yo";

  S myStruct;
  myStruct.a = 0;

  auto myClass = new C;
  myClass.a = 0;

  auto myClass2 = myClass;
  myClass2.a = 0;

  // writefln("Hello, world");
  return 0;
}

