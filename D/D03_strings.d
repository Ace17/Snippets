#!dmd -run
import std.stdio;
import std.algorithm;

int main()
{
  {
    string s1 = "Hello";
    string s2 = "World";
    string s3 = s1 ~ ", " ~ s2;

    writeln(s3);
  }

  {
    string s = "a b c d";
    foreach(element; splitter(s))
    {
      writefln("Element: %s", element);
    }
  }

  {
    if(canFind("remy matthieu isabelle audrey frederic burno", "matthieu"))
    {
      writefln("matthieu is part of the team");
    }
    else
    {
      writefln("matthieu is not part of the team");
    }
  }

  {
    string s;
    if(s == "")
    {
      writefln("Default strings are empty");
    }
  }

  {
    string s = "hello, world";
    writefln("The first letter is: %s", s[0]);

    string s2 = s[1..$];
    writefln("Without the first letter, it gives: %s", s2);
  }
  return 0;
}
