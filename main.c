#include "toy.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
  if (argc != 3) {
    printf("please inputs start and end\n");
    printf("Usage: ./range_sum <start num> <end num>");
    exit(1);
  }
  size_t res = toy_sum(atoll(argv[1]), atoll(argv[2]));
  toy_print_size_t(res);
  printf("use printf: %lu\n", res);
  return 0;
}