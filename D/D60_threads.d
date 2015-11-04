#!dmd -run
import std.stdio;
import core.thread;

void Sleep()
{
  Thread.sleep( dur!("msecs")( 500 ) ); // sleep for 500 milliseconds
}

void threadProc()
{
  for(int i=0;i < 5;++i)
  {
    writefln("[aux thread] Hello %s!", i);
    Sleep();
  }
}

void threadProcWithParameter(int Parameter)
{
  for(int i=0;i < Parameter;++i)
  {
    writefln("[aux thread] Hello %s/%s!", i+1, Parameter);
    Sleep();
  }
}

int main()
{
  {
    auto myThread = new Thread(&threadProc);
    writefln("[main thread] starting aux thread");
    myThread.start();
    myThread.join();
    writefln("[main thread] aux thread terminated");
  }

  {
    void threadEntryPoint()
    {
      threadProcWithParameter(3);
    }

    auto myThread = new Thread(&threadEntryPoint);
    writefln("[main thread] starting aux thread");
    myThread.start();
    myThread.join();
    writefln("[main thread] aux thread terminated");
  }

  return 0;
}
