.text
.globl foo1

foo1:
    pushq %rbp
    movq %rsp, %rbp  # abre espaco na pilha
    subq $16, %rsp


    cvtss2sd %xmm0, %xmm0   
    call sin   


    cvtsd2ss %xmm1, %xmm1       
    addss %xmm1, %xmm0

    cvtsd2ss %xmm0,%xmm0


    leave        
    ret                        