.text

.globl foo

foo:
    pushq %rbp
    movq %rsp, %rbp  # abre espaco na pilha
    
    cvtss2sd %xmm1, %xmm1 
 
    movsd %xmm0, %xmm2 # coloca o conteudo de a em outro registrador para assim n perder a referencia
    addsd %xmm1, %xmm2 # a + b 
    movsd %xmm2,%xmm3 # guarda o resultado da soma

    movsd %xmm0,%xmm4 # coloca o conteudo de a em outro registrador para assim n perder a referencia
    subsd %xmm1, %xmm4 # a - b
    movsd %xmm4,%xmm5  # guarda o resultado da subtracao
    
    mulsd %xmm3, %xmm5 # multiplica a soma pela subtracao
    movsd %xmm5, %xmm0
    
    cvtsd2ss %xmm0, %xmm0 # converte para float
    leave
    ret