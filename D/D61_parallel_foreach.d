#!dmd -run

import std.stdio;
import std.parallelism;

int main()
{
  MyRange range;

  stdout.writefln("Spawning threads");
  stdout.flush();

  immutable numThreads = 8;
  auto pool = new TaskPool(numThreads-1);
  scope(exit) pool.finish();

  // create list of tasks
  int[] allValues;
  for(int i=0;i < 100;++i)
    allValues ~= i;

  // execute them in parallel
  foreach(value; pool.parallel(allValues, 1))
  {
    writefln("Executing with value %s", value);
    stdout.flush();
  }

  return 0;
}

