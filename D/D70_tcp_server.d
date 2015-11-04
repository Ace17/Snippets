#!dmd -run
import std.conv;
import std.socket;
import std.stdio;
import core.thread;

void clientThread(Socket s)
{
  writefln("Client connected!");
  for(;;)
  {
    char[16] buf;
    immutable n = s.receive(buf);
    if(n == 0)
      break;
    writefln("Received %s bytes", n);
  }

  writefln("Client disconnected");
  s.close();
}

void spawnClientThread(Socket s)
{
  void clientThreadEntryPoint()
  {
    clientThread(s);
  }

  auto clientThread = new Thread(&clientThreadEntryPoint);
  clientThread.start();
}

int main(string[] args)
{
  immutable ushort PORT = 10666;

  Socket listener = new TcpSocket;
  assert(listener.isAlive);
  listener.blocking = true;
  listener.bind(new InternetAddress(PORT));
  listener.listen(10);
  writefln("Listening on port %s.", PORT);

  for(;;)
  {
    auto clientSocket = listener.accept();
    spawnClientThread(clientSocket);
  }

  return 0;
}

