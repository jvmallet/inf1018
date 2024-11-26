.text
.globl boo

boo:
    pushq %rbp
    movq %rsp,%rbp
    subq $64, %rsp

    movsd %xmm0, -8(%rbp) # v

    movl $1 , -12(%rbp) # a1[0]
    movl $2 , -16(%rbp) # a1[1]
    movl $3 , -20(%rbp) # a1[2]
    movl $4 , -24(%rbp) # a1[3]

    
    movl $0, -60(%rbp) # i

    leaq -12(%rbp),%rdi     #primeiro parametro de foo
    leaq -56(%rbp), %rsi    #segundo parametro de foo
    movl $4, %edx   #terceiro parametro de foo

    call foo

    loop:
        movl -60(%rbp), %ecx
        cmpl $4, %ecx
        jge end

        movl -60(%rbp),%eax 
        cltq 
        movsd -56(%rbp,%rax,8),%xmm1
        addsd %xmm1,%xmm0

        addl $1, -60(%rbp)

        jmp loop
    end:
        movsd -8(%rbp),%xmm0
        leave
        ret





    

    