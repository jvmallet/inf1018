#include <stdio.h>
#include <math.h>

// Declare the Assembly function
extern float foo(double a, float b);

int main() {
    double a = 5.0;
    float b = 2.0;

    float result = foo(a, b);
    printf("foo(%f, %f) = %f\n", a, b, result);

    return 0;
}
