///////////////////////////////////////////////////////////////////////////////
// Simple object with:
// - encapsulation
// - no polymorphism
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// header file
///////////////////////////////////////////////////////////////////////////////
struct Object_s;
typedef struct Object_s Object;

Object* Object_create();
void Object_Op1(Object* o, int param, float param2);
int Object_Op2(Object* o, const char* s);
void Object_destroy(Object* o);

///////////////////////////////////////////////////////////////////////////////
// implementation file
///////////////////////////////////////////////////////////////////////////////
#include <malloc.h>

typedef struct Object_s
{
  int data1;
  int data2;
  void* buffer;
} Object;

// constructor
Object* Object_create()
{
  Object* o = malloc(sizeof(Object));
  o->data1 = 3;
  o->data2 = 7;
  o->buffer = malloc(16);
  return o;
}

// destructor
void Object_destroy(Object* o)
{
  free(o->buffer);
  free(o);
}

void Object_Op1(Object* o, int param, float param2)
{
}

int Object_Op2(Object* o, const char* s)
{
}

