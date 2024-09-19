# Resumo Assemby

__<--- Overview da Estrutura ao Lado__

Em assemby podemos usar varios tipos como variaveis -> exemplo:
__Quando tratamos de elementos com 64 bits:__
Todos os %r.. podem ser usados:

%rax
%rbx
%rcx    
.
.
.


Porem quando tratamos de ponteiros teriamos que usar:

%rbp e %rsp

Mesma lógica quando se trata de 32 , 16 , 8 ou 0 bits

Considerando o de 32 sendo o mais usado
Alguns Exemplos são:

%eax
%ebx
%ecx 
.
.
.
<----- Tudo na foto ao lado


Alguns comandos ....

## Movimentacao de Dados


movq ->  Move um valor de 64 bits (quadword) entre registradores ou entre um registrador e uma memória.
- Exemplo: movq %rbx, -8(%rbp) – Isso move o valor de 64 bits que está no registrador %rbx para o endereço -8(%rbp) (em relação ao ponteiro base %rbp).
- Exemplo: movq $nums, %r12 – Isso coloca o endereço do array nums no registrador %r12.
    - O -8 indica que o valor que rbx sera movido para o endereco de rbp que esá 8 bytes antes de rbx

movl: Move um valor de 32 bits (doubleword) entre registradores ou entre um registrador e uma memória.
- Exemplo: movl $0, %ebx – Isso move o valor imediato 0 para o registrador %ebx (parte de 32 bits do registrador %rbx).
- Exemplo: Exemplo: movl (%r12), %eax – Isso move o valor de 32 bits no endereço apontado por %r12 para o registrador %eax.
    - Moveria apenas 32 bits para o eax, considerando que o valor de r12 é de 64 bits -> Nesse caso nao teria problema, pois estamos lidando com um array de inteiros (32 bits). Porém se nao fosse, isso significa que apenas os 4 bytes (32 bits) mais baixos do valor na memória são movidos, deixando os 4 bytes superiores (se houver) sem serem movidos para o %eax.

## Instruções Aritméticas


addl -> Soma um valor de 32 bits ao valor de um registrador ou uma memória, armazenando o resultado no mesmo destino.

- Exemplo: addl $1, %ebx – Isso adiciona o valor 1 ao registrador %ebx

addq: Soma um valor de 64 bits (quadword).

- Exemplo: addq $4, %r12 – Isso adiciona 4 ao registrador %r12 (equivalente a avançar o ponteiro em uma posição de 32 bits em um array de inteiros).

subq: Subtrai um valor de 64 bits de um registrador ou memória.

- Exemplo: subq $16, %rsp – Isso subtrai 16 do registrador %rsp, que é o ponteiro da pilha, alocando espaço na pilha.

subl: Subtrai um valor de 32 bits de um registrador ou memória.

- Exemplo: subl $8, %eax   # Subtrai 8 do registrador de 32 bits %eax
    - Nesse caso, 8 será subtraído do valor armazenado no registrador %eax, que é a parte de 32 bits do registrador de 64 bits %rax.
        - Quando vc usa o subl, ex: dado esse numero: 0x0000000100000000 -> se vc quiser aplicar o subl com o numero $1 -> vc teria que diminuir apenas a parte inferior dos 32 bits do numero, sendo 0x00000000 - 0x1 = 0xFFFFFFFF. 



## Instruções de Comparação

cmpl: Compara dois valores de 32 bits e ajusta os flags (marcadores de condição) da CPU, que podem ser usados para decidir o fluxo do programa (pulos condicionais, por exemplo).

- Exemplo: cmpl $4, %ebx – Compara o valor imediato 4 com o valor no registrador %ebx. Se eles forem iguais, o flag de "igualdade" será ativado.



## Instruções de Controle de Fluxo

jmp: Um salto incondicional para um rótulo (label).

- Exemplo: jmp L1 – Salta incondicionalmente para o rótulo L1, que está no início do loop.


je: Um salto condicional, que acontece apenas se o último comando de comparação (cmpl) tiver indicado que os valores eram iguais.

- Exemplo: je L2 – Se a comparação anterior (cmpl $4, %ebx) resultar em igualdade (ebx == 4), salta para o rótulo L2.











## Instruções de Função

pushq: Empurra (salva) um valor de 64 bits da CPU na pilha.

- Exemplo: pushq %rbp – Salva o valor de %rbp (ponteiro base da função anterior) na pilha para ser restaurado depois.
    - O comando pushq é usado para empurrar (ou armazenar) um valor de 64 bits no topo da pilha (stack). A pilha é uma área da memória onde os valores são armazenados temporariamente, normalmente usada em chamadas de função e para salvar o estado dos registradores.

- Exemplo mais pratico:
    Antes de pushq:

    O ponteiro da pilha (%rsp) aponta para o topo da pilha.
    Quando você faz um pushq, o valor de 64 bits que você deseja armazenar é colocado no topo da pilha, e o ponteiro da pilha é ajustado para baixo (decrementado) para abrir espaço para o novo valor.

    Ação do pushq:

    pushq %rbx: Isso salva o valor de 64 bits no registrador %rbx no topo da pilha.
    O registrador de ponteiro da pilha %rsp é automaticamente ajustado para refletir que um novo valor foi adicionado à pilha (diminuído em 8 bytes, já que estamos trabalhando com 64 bits).

    - Exemplo prático: Vamos dizer que o valor de %rsp seja 0x7fffffffeff0 (o topo da pilha) e o valor de %rbx seja 0x1234567890abcdef.

        Antes do pushq:

        %rsp -> 0x7fffffffeff0
        %rbx -> 0x1234567890abcdef

        Quando você executa pushq %rbx, o valor de %rbx (0x1234567890abcdef) será colocado no topo da pilha, e o valor de %rsp será ajustado para 0x7fffffffeff0 - 8 = 0x7fffffffeff8 (porque movemos o ponteiro para baixo para acomodar os 8 bytes).

         Depois do pushq:

        Memória na pilha (endereçada por %rsp) agora contém 0x1234567890abcdef
        %rsp -> 0x7fffffffeff8 (ajustado para baixo em 8 bytes)

    - Outro Exemplo:

        pushq   %rbp        # Salva o valor original do ponteiro base (rbp) na pilha
        movq    %rsp, %rbp  # Atualiza o ponteiro base para o valor atual do ponteiro da pilha (rsp)

        pushq %rbp: Salva o valor atual do %rbp (ponteiro base) na pilha.

        movq %rsp, %rbp: Atualiza %rbp para o valor do %rsp, marcando o início do stack frame da função.



leave: Limpa o stack frame da função. É equivalente a restaurar o ponteiro de base %rbp e ajustar o ponteiro de pilha %rsp.

- Exemplo: No final do código, leave desfaz as operações de alocação de stack frame feitas no início.



ret: Retorna da função, retirando o endereço de retorno da pilha e saltando para ele.



call: Chama uma função, salvando o endereço de retorno na pilha e saltando para a função.

- Exemplo: call printf – Chama a função printf, salvando o endereço de retorno para que possa continuar a execução após a função ser concluída.



# Prologo e Epílogo 

Esses trechos são responsáveis por salvar e restaurar o estado do programa (valores de registradores e ponteiros de pilha/base) antes e depois da execução da função:

- Prólogo: 
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)
    movq    %r12, -16(%rbp)


Aqui está uma representação da pilha antes e depois da subtração de 16 de %rsp.





+-------------------+    <- Endereço %rsp (apontando para o valor de %rbp)
|   Valor de %rbp    |    
+-------------------+
|                   | <- %rbp aponta para o topo da pilha (stack frame)




+-------------------+    <- %rbp ainda aponta aqui (topo do stack frame)
|   Valor de %rbp    |
+-------------------+
|   16 bytes livres  |    <- %rsp agora aponta para cá (16 bytes abaixo)
+-------------------+



+-------------------+    <- %rbp (ainda aponta aqui, valor de %rbp salvo)
|   Valor de %rbp    |    
+-------------------+
|    Valor de %rbx   |    <- Armazenado 8 bytes abaixo de %rbp (-8(%rbp))
+-------------------+
|    Valor de %r12   |    <- Armazenado 16 bytes abaixo de %rbp (-16(%rbp))
+-------------------+



- O epílogo:


    movq  -8(%rbp), %rbx
    movq  -16(%rbp), %r12
    leave
    ret

    Restaura os valores de %rbx e %r12, desfaz o stack frame com leave, e retorna com ret.







