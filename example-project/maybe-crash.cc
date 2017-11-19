#include <cassert>
#include <cstdlib>
#include <iostream>

int main(int argc, char *argv[])
{
  (void) argc; (void) argv;

  int x;
  std::cin >> x;

  switch (x) {
    case 1:
      std::abort();
    case 2:
      return 1 / 0;
    case 3:
      assert(false);
    case 4:
      throw("exception");
    default:
      return 0;
  }

}
