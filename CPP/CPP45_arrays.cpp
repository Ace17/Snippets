#include <vector>

int main()
{
  auto const a = vector<uint8_t>({ 1, 2, 3, 4, 5, 6, 7 });
  auto const b = vector<uint8_t>({ 0, 2, 4, 6, 8, 10, 7 });
  if(a != b)
  {
  }
  return 0;
}
