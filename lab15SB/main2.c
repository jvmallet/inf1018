#include <stdio.h>
#include <math.h>

extern float foo1(float a, float b);

int main() {
    float a = 1.57079632679;  // Aproximadamente PI/2
    float b = 1.0;

    float result = foo1(a, b);
    printf("foo1(%.2f, %.2f) = %.2f\n", a, b, result);

    return 0;
}
