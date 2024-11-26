double foo3 (double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
}

.text
.globl foo3 

foo3:
    pushq %rbp
    movq %rsp,%rbp
    subq $32, %rsp

    movl $0, %ecx
    movsd zero(%rip),%xmm1

    loop:
        cmpl %esi,%ecx
        jge loop_end

        movsd (%rdi), %xmm0 

        movq %rdi, -8(%rbp)
        movsd %xmm1, -16(%rbp)
        movl %ecx, -20(%rbp)
        movq %esi, -24(%rbp)

        call sin 

        movq -8(%rbp), %rdi
        movsd -16(%rbp),%xmm1
        movl -20(%rbp),%ecx 
        movq -24(%rbp),%esi

        addsd %xmm0,%xmm1 

        addq $8,%rdi
        addl $1, %ecx 
        jmp loop 

    loop_end:
        
        movsd %xmm1, %xmm0 
        leave
        ret

zero:
    .double 0.0
