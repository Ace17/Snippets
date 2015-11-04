///////////////////////////////////////////////////////////////////////////////
// base header file
///////////////////////////////////////////////////////////////////////////////
struct Animal_s;
typedef struct Animal_s Animal;

typedef struct
{
  void (*eat)(Animal* o, int foodType, float amount);
  int (*sleep)(Animal* o, float duration);
  void (*delete)(Animal* o);
} const AnimalVtable;

struct Animal_s
{
  AnimalVtable* vtbl;
};

void Animal_eat(Animal* o, int foodType, float amount)
{
  o->vtbl->eat(o, foodType, amount);
}

void Animal_sleep(Animal* o, float duration)
{
  o->vtbl->sleep(o, duration);
}

void Animal_delete(Animal* o)
{
  o->vtbl->delete(o);
}

///////////////////////////////////////////////////////////////////////////////
// dog header file
///////////////////////////////////////////////////////////////////////////////
Animal* Dog_new();

///////////////////////////////////////////////////////////////////////////////
// client code
///////////////////////////////////////////////////////////////////////////////

void f()
{
  Animal* a = Dog_new();
  Animal_eat(a, 3, 1.0f);
  Animal_delete(a);
}

///////////////////////////////////////////////////////////////////////////////
// dog implementation file
///////////////////////////////////////////////////////////////////////////////
#include <malloc.h>

static AnimalVtable Dog_vtable;

typedef struct
{
  AnimalVtable* vtbl;
  int data1;
  int data2;
  void* buffer;
} Dog;

Animal* Dog_new()
{
  Dog* o = malloc(sizeof(Dog));
  o->vtbl = &Dog_vtable;
  o->data1 = 3;
  o->data2 = 7;
  o->buffer = malloc(16);
  return (Animal*)o;
}

void Dog_delete(Dog* o)
{
  free(o->buffer);
  free(o);
}

void Dog_eat(Dog* o, int foodType, float amount)
{
}

int Dog_sleep(Dog* o, float duration)
{
  return 7;
}

static AnimalVtable Dog_vtable =
{
  (void*)&Dog_eat,
  (void*)&Dog_sleep,
  (void*)&Dog_delete,
};

