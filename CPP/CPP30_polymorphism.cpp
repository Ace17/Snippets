#include <cassert>
#include <iostream>

///////////////////////////////////////////////////////////////////////////////
// abstract class (=interface)
///////////////////////////////////////////////////////////////////////////////

struct IAnimal
{
  virtual void makeSound() = 0;
};

///////////////////////////////////////////////////////////////////////////////
// user of the interface (doesn't know about concrete classes below)
///////////////////////////////////////////////////////////////////////////////

void recordAnimalSound(IAnimal* pAnimal)
{
  // start recorder ...
  pAnimal->makeSound();
  // stop recorder ...
}

///////////////////////////////////////////////////////////////////////////////
// concrete classes
///////////////////////////////////////////////////////////////////////////////

struct Dog : public IAnimal
{
  virtual void makeSound() override
  {
    std::cout << "Waf" << std::endl;
  }
};

struct Cat : public IAnimal
{
  virtual void makeSound() override
  {
    std::cout << "Meow" << std::endl;
  }
};

struct Llama : public IAnimal
{
  virtual void makeSound() override
  {
    std::cout << "Blat" << std::endl;
  }
};

///////////////////////////////////////////////////////////////////////////////
// main
///////////////////////////////////////////////////////////////////////////////

int main()
{
  {
    Llama serge;
    recordAnimalSound(&serge); // prints "Blat"
  }

  {
    // test with hidden local class
    struct Alien : public IAnimal
    {
      virtual void makeSound() override
      {
        std::cout << "beep" << std::endl;
      }
    };

    Alien roswell;

    recordAnimalSound(&roswell); // prints "beep"
  }


  return 0;
}

