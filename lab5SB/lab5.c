#include <stdio.h>

void dump(void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main(void) {
  union U2 {
  short s;
  char c[5];
  }U2;



  printf("x:\n");
  dump(&U2, sizeof(U2));

  return 0;
}
