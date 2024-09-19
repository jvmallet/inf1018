#include <stdio.h>

int is_little() {
    unsigned int x = 1;
    return *((unsigned char*)&x) == 1;
}

int main() {
    if (is_little()) {
        printf("O sistema é little-endian.\n");
    } else {
        printf("O sistema é big-endian.\n");
    }
    
    return 0;
}
