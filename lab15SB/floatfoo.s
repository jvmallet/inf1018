.text

.globl foo

foo:
    pushq %rbp
    movq %rsp, %rbp 
    
    cvtss2sd %xmm1, %xmm1
    
    addsd %xmm0, %xmm1 # a + b 
    movsd %xmm1, %xmm2 # move o resultado da soma para xmm2


    subsd %xmm1, %xmm0 
    movsd %xmm0,%xmm3 # move o resultado da subtracao para xmm3
    
    mulsd %xmm2, %xmm3 # multiplica a soma pela subtracao
    movq %xmm3, %xmm0
    
    cvtsd2ss %xmm0, %xmm0 # converte para float
    leave
    ret