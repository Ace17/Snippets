#include <iostream>
#include <algorithm> // for std::find
#include <list>

int main()
{
  std::list<int> myList;

  myList.push_back(40);
  myList.push_back(30);
  myList.push_back(20);
  myList.push_back(10);

  /////////////////////////////////////////////////////////////////////////////
  // classical way of browsing the list
  for(std::list<int>::iterator i=std::begin(myList);i != std::end(myList);++i)
  {
    std::cout << "Value=" << *i << std::endl;
  }

  /////////////////////////////////////////////////////////////////////////////
  // with auto (lighter)
  for(auto i=std::begin(myList);i != std::end(myList);++i)
  {
    std::cout << "Value=" << *i << std::endl;
  }

  /////////////////////////////////////////////////////////////////////////////
  // use custom foreach
#define foreach(iterator, container) \
  for(auto iterator=std::begin(container);iterator != std::end(container);++i)

  foreach(i, myList)
  {
    std::cout << "Value=" << *i << std::endl;
  }

  // sort list
  myList.sort();

  // searches for the value 30 in the list
  auto i = std::find(myList.begin(), myList.end(), 30);
  if(i != std::end(myList))
    std::cout << "Element 30 does not exist" << std::endl;
  else
    std::cout << "Element 30 exists" << std::endl;

  return 0;
}
