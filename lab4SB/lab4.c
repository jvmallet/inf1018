#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  char c = 150;
  short s = -3;
  int i = -151;
  printf("dump de c: \n");
  dump(&c, sizeof(c));
  printf("dump de s: \n");
  dump(&s, sizeof(s));
  printf("dump de i: \n");
  dump(&i, sizeof(i));
  return 0;
}


//2)

#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  short l = -32765;
  unsigned short k = 32771;
  printf("l=%d, k=%u \n", l, k);
  printf("dump de l: \n");
  dump(&l, sizeof(l));
  printf("dump de k: \n");
  dump(&k, sizeof(k));
  return 0;
}




/* programa 3*/
#include <stdio.h>

int main (void) {
  int x = 0xffffffff;
  unsigned int y = 2;
  printf("x=%d, y=%d\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
  return 0;
}



#include <stdio.h>

void dump(void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main(void) {
  signed char sc = -1;
  unsigned int ui = sc;

  printf("sc = %d, ui = %u\n", sc, ui);
  printf("Representação interna de ui:\n");
  dump(&ui, sizeof(ui));

  return 0;
}
