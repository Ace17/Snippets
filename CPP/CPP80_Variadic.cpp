//------------------------------------------------------------------------------
// format implementation
//------------------------------------------------------------------------------

template<typename T>
std::string ToString(T const& val)
{
  std::stringstream ss;
  ss << val;
  return ss.str();
}

template<>
inline std::string ToString(std::string const& val)
{
  std::stringstream ss;
  ss << "\"";
  ss << val;
  ss << "\"";
  return ss.str();
}

template<typename T>
std::string ToString(std::vector<T> const& v)
{
  std::stringstream ss;
  ss << "[";
  foreach(i_element, v)
  {
    if(i_element != std::begin(v))
      ss << ", ";
    ss << ToString(*i_element);
  }
  ss << "]";
  return ss.str();
}

inline std::string format(const std::string& format)
{
  return format;
}

template<typename T, typename... Arguments>
std::string format(const std::string& fmt, const T& firstArg, Arguments... args)
{
  std::string r;
  size_t i=0;
  while(i < fmt.size())
  {
    if(fmt[i] == '%')
    {
      ++i;
      if(i >= fmt.size())
        throw std::runtime_error("Invalid fmt specifier");

      if(fmt[i] == '%')
        r += '%';
      else if(fmt[i] == 's')
      {
        r += ToString(firstArg);
        return r + format(fmt.substr(i+1), args...);
      }
    }
    else
    {
      r += fmt[i];
    }
    ++i;
  }
  return r;
}

//------------------------------------------------------------------------------
// writefln implementation
//------------------------------------------------------------------------------

template<typename... Arguments>
void writefln(const std::string& fmt, Arguments... args)
{
  std::cout << format(fmt, args...) << std::endl;
}

