#!dmd -run
import std.stdio;
import std.conv;

class IntContainer
{
  int opApply(int delegate(int) f)
  {
    f(10);
    f(15);
    f(20);
    return 1;
  }
}

void main()
{
  {
    foreach(i; 0..5)
    {
      writefln("i=%s", i);
    }
  }

  {
    // normal array
    immutable numbers = [10, 20, 30, 40, 50];

    writefln("In normal order:");
    foreach(num; numbers)
    {
      writefln("%s", num);
    }

    writefln("In normal order with indices:");
    foreach(i, num; numbers)
    {
      writefln("[%s] %s", i, num);
    }

    writefln("In reverse order:");
    foreach_reverse(num; numbers)
    {
      writefln("%s", num);
    }
  }

  {
    // associative array (map)
    int[string] peopleAges;
    peopleAges["SebA"] = 29;
    peopleAges["Matthieu"] = 24;
    peopleAges["RemyF"] = 29;

    foreach(name, age; peopleAges)
    {
      writefln("%s is %s years old", name, age);
    }
  }

  {
    // custom container
    auto container = new IntContainer;

    foreach(i; container)
    {
      writefln("Container[]=%s", i);
    }
  }

}


