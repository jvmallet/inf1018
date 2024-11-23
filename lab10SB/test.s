// Teste com o Assembly Traduzido para a sintexe do ARM64.


.text
.globl _start    // Define o ponto de entrada global

_start:
    // Carregar o número da syscall no registrador x16
    movz x16, #0x2000      // Carrega os 16 bits superiores
    movk x16, #0x1, lsl #0 // Carrega os 16 bits inferiores

    // Carregar o código de saída no registrador x0
    mov x0, #42            // Define o código de saída

    // Fazer a syscall
    svc #0                 // Realiza a syscall
