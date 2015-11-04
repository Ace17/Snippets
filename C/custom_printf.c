#include <stdarg.h>
#include <stdio.h>

void my_vprintf(char const* sFormat, va_list args)
{
  printf("Msg: ");
  vprintf(sFormat, args);
  printf("\n");
}

void my_printf(char const* sFormat, ...)
{
  va_list args;
  va_start(args, sFormat);
  my_vprintf(sFormat, args);
  va_end(args);
}


int main()
{
  my_printf("Hello, world");
  return 0;
}

