#!dmd -run
import std.stdio;
import std.algorithm : sort;
import std.conv;

void main()
{
  string[] myArray = [ "a", "b", "c" ]; // explicit type
  auto myArray2 = [ "a", "b", "c" ]; // also works with auto
  immutable myArray3 = [ "a", "b", "c" ]; // non-modifiable array

  writefln("myArray = %s", myArray);

  // array concatenation
  int[] tab;

  tab ~= 1;
  tab ~= 3;
  tab ~= 5;
  tab ~= 6;
  tab ~= 4;
  tab ~= 2;

  writefln("tab=%s", tab);
  writefln("tab[0..$]=%s", tab[0..$]);
  writefln("tab[2..4]=%s", tab[2..4]);

  // foreach on array
  foreach(i, val; tab)
  {
    writefln("tab[%s]=%s", i, val);
  }

  tab.reverse;
  writefln("reversed tab=%s", tab);

  bool myOrder(int a, int b)
  {
    return a > b;
  }

  sort!(myOrder)(tab);
  writefln("custom-sorted tab=%s", tab);

  // foreach on array with modifiable values
  foreach(ref val; tab)
  {
    val += 100;
  }
  writefln("modified tab=%s", tab);
}


