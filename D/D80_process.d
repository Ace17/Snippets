import std.process;

int main()
{
  // Use cURL to download the dlang.org front page, pipe its
  // output to grep to extract a list of links to ZIP files,
  // and write the list to the file "D downloads.txt":
  auto p = pipe();
  auto outFile = File("D downloads.txt", "w");
  auto cpid = spawnProcess(["curl", "http://dlang.org/download.html"], std.stdio.stdin, p.writeEnd);
  scope(exit) wait(cpid);
  auto gpid = spawnProcess(["grep", "-o", `http://\S*\.zip`], p.readEnd, outFile);
  scope(exit) wait(gpid);
  return 0;
}
