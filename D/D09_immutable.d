auto g_Values = [ 1 , 3, 4 ,5 ,6 ];

int main()
{
  f(g_Values);
  return 0;
}

void f(immutable int[] values)
{
  auto s1 = sum(values);
  g();
  auto s2 = sum(values);
}

void g()
{
  //g_Values[0] = 0;
}
