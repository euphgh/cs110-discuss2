#include "toy.h"
#include <stdio.h>

size_t toy_sum(size_t start, size_t end) {
  size_t sum = 0;
  for (size_t i = start; i < end; i++) {
    sum += i;
  }
  return sum;
}
void toy_print_size_t(size_t x) { printf("use toy_print_size_t %lu\n", x); }
