static int g_Variable;

class C
{
public:
  static int m_Member;
};

int C::m_Member;

void f()
{
  C c;
  c.m_Member = 1;
  g_Variable = 0;
}
