#include <iostream>
#include <stdexcept>

#include <boost/lambda/lambda.hpp>
#include <iterator>
#include <algorithm>

#include "dummy.hpp"
//#include <boost/stacktrace.hpp>

#define UNW_LOCAL_ONLY
#include <libunwind.h>

void show_backtrace (void) {
  unw_cursor_t cursor; unw_context_t uc;
  unw_word_t ip, sp;

  unw_getcontext(&uc);
  unw_init_local(&cursor, &uc);
  while (unw_step(&cursor) > 0) {
    unw_get_reg(&cursor, UNW_REG_IP, &ip);
    unw_get_reg(&cursor, UNW_REG_SP, &sp);
    printf ("ip = %lx, sp = %lx\n", (long) ip, (long) sp);
  }
}

auto main() -> int
{
    using namespace boost::lambda;  
    typedef std::istream_iterator<int> in;

    std::for_each(
      in(std::cin), in(), std::cout << (_1 * 3) << " " );

  //  std::cout << boost::stacktrace::stacktrace();

  //std::cout << fib(10) << '\n';
  show_backtrace();
}
