.section .text
.globl foo

foo:
    movl %edi, %eax
    jmp add
    ret
