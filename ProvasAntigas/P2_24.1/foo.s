.text
.globl foo

foo:
    pushq %rbp
    movq %rsp,%rbp  
    subq $16, %rbp
    
    movl %esi,%ecx
    cmpl $0, %ecx
    jz .loop_end

    loop:
        movq $0.0, (%rdi)
        addq $8, %rdi
        decl $1,%ecx
        jnz loop

    loop_end:
        leave
        ret

    

         