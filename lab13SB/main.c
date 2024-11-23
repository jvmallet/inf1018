#include <stdio.h>
#include <string.h>

// Definição do tipo ponteiro para função
typedef int (*funcp)(int x);

// Função `add` declarada no mesmo arquivo
int add(int x) {
    return x + 1;
}

int main() {
    // Array para armazenar o código de máquina da função foo
    unsigned char codigo[] = {
        0x89, 0xF8,       // mov %edi, %eax
        0xE8, 0x00, 0x00, 0x00, 0x00, // call <add> (com deslocamento a ser corrigido)
        0xC3              // ret
    };

    // Cálculo do deslocamento para a chamada de add
    void *endereco_codigo = (void *)codigo;          // Início do array (endereço do código)
    void *endereco_add = (void *)add;                // Endereço da função add
    int deslocamento = (int)(endereco_add - (endereco_codigo + 5)); // Calcula o deslocamento

    // Armazena o deslocamento em little-endian nos 4 bytes após o opcode e8
    codigo[3] = deslocamento & 0xFF;           // Byte menos significativo
    codigo[4] = (deslocamento >> 8) & 0xFF;    // Byte seguinte
    codigo[5] = (deslocamento >> 16) & 0xFF;   // Byte seguinte
    codigo[6] = (deslocamento >> 24) & 0xFF;   // Byte mais significativo

    // Converte o array para um ponteiro de função
    funcp f = (funcp)codigo;

    // Executa a função foo armazenada no array
    int resultado = f(10);

    // Imprime o resultado
    printf("Resultado: %d\n", resultado); // Deve imprimir 12 (10 + 1 + 1)

    return 0;
}
