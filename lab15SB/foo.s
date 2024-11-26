 float foo (double a, float b) {
  return (a+b)*(a-b);
}


.text
.globl foo

foo:
    pushq %rbp
    movq %rsp, %rbp

    cvtss2sd %xmm1,%xmm1

    movsd %xmm0, %xmm2
    addsd %xmm1, %xmm2 # soma a + b e guarda o resultado em xmm2

    movsd %xmm0, %xmm3
    subsd %xmm1,%xmm3 # a - b

    mulsd %xmm2,%xmm3
    movsd %xmm3,%xmm0 

    cvtsd2ss %xmm0,%xmm0
    leave
    ret 



    