static int g_Variable;

namespace 
{
  int g_Variable2;
}

class C
{
public:
  static int m_Member;
};

void g()
{
  g_Variable = 1;
  C c;
  c.m_Member = 1;
}

int main()
{
  return 0;
}
