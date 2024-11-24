.section .text
.globl foo1

foo1:
    movss %xmm1, %xmm2           
    # Converte 'a' (float em xmm0) para double
    cvtss2sd %xmm0, %xmm0        
    call sin                     
    cvtsd2ss %xmm0, %xmm0       
    addss %xmm2, %xmm0        
    ret                        