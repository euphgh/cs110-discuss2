#include "toy.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
  size_t res = toy_sum(0, 9);
  toy_print_size_t(res);
  printf("use printf: %lu\n", res);
  return 0;
}