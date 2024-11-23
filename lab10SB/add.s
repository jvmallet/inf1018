.text

.globl add

add:
    # Salvar o frame pointer e configurar o stack pointer
    stp x29, x30, [sp, #-16]!  # Salva x29 e x30 na pilha
    mov x29, sp               # Atualiza o frame pointer

    # Comparar x com NULL
    cmp x0, #0                # x == NULL?
    b.eq end                  # Se x == NULL, pula para o final

    # Carregar o valor de x->val (assumindo que x é um ponteiro para uma estrutura)
    ldr w1, [x0]              # Carrega x->val em w1

    # Atualizar x para x->next e chamar a função recursiva
    ldr x0, [x0, #8]          # Carrega x->next em x0
    bl add                    # Chama a função recursiva, retorno estará em w0

    # Soma o valor retornado com x->val
    add w0, w0, w1            # w0 += w1

    # Restaurar os registradores e retornar
    ldp x29, x30, [sp], #16   # Restaura x29 e x30
    ret                       # Retorna

end:
    # Retornar 0
    mov w0, #0                # Retorna 0
    ldp x29, x30, [sp], #16   # Restaura x29 e x30
    ret                       # Retorna
