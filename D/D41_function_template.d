#!dmd -run

T min(T)(T a, T b)
{
  return a < b ? a : b;
}

T sum(T)(T[] elements)
{
  auto r = cast(T)(0);
  foreach(val; elements)
    r += val;
  return r;
}

void main()
{
  int a = sum([1, 2, 3, 4]);

  min(5, 6);
}
