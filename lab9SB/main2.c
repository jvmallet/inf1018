#include <stdio.h>

int fat(int n);  // Declaração da função fat

int main(void) {
    int n = 5;
    printf("Fatorial de %d = %d\n", n, fat(n));  // Chama a função fatorial
    return 0;
}
