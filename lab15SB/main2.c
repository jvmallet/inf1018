#include <stdio.h>

// Declaração da função em Assembly
extern double foo2(float a, float b);

int main() {
    // Valores de entrada
    float a = 0.785398;  // Aproximadamente PI/4 em radianos
    float b = 1.570796;  // Aproximadamente PI/2 em radianos

    // Chama a função foo2
    double result = foo2(a, b);

    // Exibe o resultado
    printf("foo2(%.6f, %.6f) = %.6f\n", a, b, result);

    return 0;
}
