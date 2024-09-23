.section .text
.globl fat                # Torna a função fat global

fat:
    pushq %rbp            # Salva o base pointer atual
    movq %rsp, %rbp       # Define o novo base pointer

    cmpl $0, %edi         # Compara o valor de n (em %edi) com 0
    je base_case          # Se n == 0, vai para base_case

    # Caso recursivo: n * fat(n - 1)
    pushq %rdi            # Salva o valor de n na pilha (n original)
    subl $1, %edi         # n = n - 1
    call fat              # Chama fat(n - 1)

    popq %rdi             # Recupera o valor de n original da pilha
    imull %edi, %eax      # Multiplica n pelo resultado de fat(n - 1)
    jmp end               # Pula para o final da função

base_case:
    movl $1, %eax         # fat(0) = 1

end:
    movq %rbp, %rsp       # Restaura o stack pointer
    popq %rbp             # Restaura o base pointer
    ret                   # Retorna o valor em %eax
