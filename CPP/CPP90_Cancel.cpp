#include <cstdio>
#include <signal.h>
#include <pthread.h>
#include <iostream>
#include <unistd.h>
using namespace std;

void sig_hand

void* threadFunc(void*)
{
  FILE* fp = fopen("/dev/stdin", "r");
  for(;;)
  {
    char buffer[16];
    cerr << "calling fread..." << endl;
    cerr.flush();
    int n = fread(buffer, 1, 16, fp);
    cerr << "fread returns " << n << endl;
    cerr.flush();
  }
  cerr << "thread terminated" << endl;
  cerr.flush();
  fclose(fp);
}

int main()
{
  pthread_t t;
  pthread_create(&t, nullptr, &threadFunc, nullptr);

  for(int i=0;i < 3; ++i)
  {
    cerr << "Sleeping " << i << endl;
    cerr.flush();
    usleep(1000 * 1000);
  }
  cerr << "Asking the thread to terminate" << endl;

  pthread_kill(t, SIGINT);

  cerr << "Joining ..." << endl;
  cerr.flush();

  pthread_join(t, nullptr);

  cerr << "Joined!" << endl;
  cerr.flush();

  return 0;
}


