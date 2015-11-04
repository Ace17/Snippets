#!dmd -run
import std.stdio;

struct myStruct
{
  int weighted_pred_flag = 1;
  int weighted_bipred_flag = 0;
  int slice_loop_filter_across_slices_enabled_flag;
  int pps_loop_filter_across_slices_enabled_flag;
  int deblocking_filter_control_present_flag;
  int[] m_Array = [ 1, 2, 3 ];
  string m_String = "Hello, world";

  void printAllMembers()
  {
    // this foreach is evaluated at compile-time
    foreach (memberIndex, memberType; typeof(this.tupleof))
    {
      auto memberName = __traits(identifier, this.tupleof[memberIndex]);
      auto memberValue = this.tupleof[memberIndex];
      writefln("%s: %s", memberName, memberValue);
    }
  }
}


int main()
{
  myStruct s;
  s.printAllMembers();

  return 0;
}
