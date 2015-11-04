#include <iostream>
#include <iomanip>
#include <string>
#include <map>
#include <random>

using namespace std;

int main()
{
  random_device rd;

  //
  // Engines
  //
  mt19937 e2(rd());
  //knuth_b e2(rd());
  //default_random_engine e2(rd()) ;

  //
  // Distribtuions
  //
  uniform_real_distribution<> dist(0, 10);
  //normal_distribution<> dist(2, 2);
  //student_t_distribution<> dist(5);
  //poisson_distribution<> dist(2);
  //extreme_value_distribution<> dist(0,2);

  map<int, int> hist;
  for (int n = 0; n < 10000; ++n)
    ++hist[floor(dist(e2))];

  for (auto p : hist)
  {
    cout << fixed << setprecision(1) << setw(2)
      << p.first << ' ' << string(p.second/200, '*') << '\n';
  }
}

