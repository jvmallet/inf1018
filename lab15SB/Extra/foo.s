void foo (int a[], double b[], int n) {
  int *pint;
  double *pdouble;

  for (pint = a, pdouble = b; n-- ; pint++, pdouble++) {
    *pdouble = (double)*pint * 2.0;
  }
}



.text
.globl foo

foo:
    pushq %rbp
    movq %rsp,%rbp
    subq $32, %rsp

    movq %rdi, %rax          # Carrega a base de `a` no registrador %rax
    movq %rax, -8(%rbp)      # Salva pint na pilha
    movq %rsi, %rax          # Carrega a base de `b` no registrador %rax
    movq %rax, -16(%rbp)     # Salva pdouble na pilha

    loop:
        cmpl $0, %edx
        jz end 

        movq -8(%rbp), %rax # uso de %rax para nao sobrescrever os parametros
        movl (%rax), %esi        # Carrega *pint (int) em %esi
        cvtsi2sd (%esi),%xmm0 
        
        movsd .dois(%rip), %xmm1 
        mulsd %xmm1,%xmm0 

        movq -16(%rbp), %rdx
        movq %xmm0, (%rdx)

        decl $1, %edx

        addq $4, -8(%rbp)           
        addq $8, -16(%rbp)    

        jmp loop 

    loop_end:
    
    leave
    ret

dois:
    .double 2.0                 # Constante 2.0 em ponto flutuante      


        

