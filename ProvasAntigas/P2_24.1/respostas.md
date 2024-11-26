1)

Nessa struct X temos:

int i = 4 bytes
float f = 4 bytes
double d = 8 bytes
char c = 1 byte 

Os elementos de 4 bytes tem q ser alinhados em multiplos de 4

O elemento de 8 byte tem q ser alinhado em multiplo de 8

E o elemento de 1 byte pode ser alinhado em qualquer posicao

Entao teriamos algo do tipo: 

i
i
i
i
f
f
f
f
d
d
d
d
d
d
d
d
c
pp
pp
pp
pp
pp
pp
pp

Agora para os valores seriam ...

int i = -0xF = -15

Primeiro fazemos o numero -15 positivio -> 15

Em binario seria ....

15/2 = 7 -> sobra 1
7/2 = 3 -> sobra 1
3/2 = 1 sobra 1
1/2 = 1

1 1 1 1 -> Como é um int

00000000 00000000 00000000 00001111

Agora fazemos o complemento de um

Invertendo todos os bits

11111111 11111111 11111111 11110000

E agora somamos 1 ao numero resultante


11111111 11111111 11111111 11110000

+
 
                                   1
------------------------------------------

11111111 11111111 11111111 11110001


Para passar apra hexadecimal, divida o numero em blocos de 4


1111 1111 1111 1111 1111 1111 1111 0001


Convertendo para decimal seria ...

0001 = 0*2^3 + 0*2^2 + 0*2^1 + 1 *2^0 =  1  

1111 = 1*2^3 + 1*2^2 + 1*2^1 + 1*2^0 = 15 

Os outros grupos tambem sao 15 


Assim ficando .... 

FF FF FF F1

Na memoria seria ...

F1 
FF
FF
FF


Para o float f = 0.625

Sinal(1bit) = 0 -> positivo

Expoente (16bits) = 0 em binario é 0 

Logo 0. 

Para converter 0.625 em binario  ...

0.625 * 2 = 1.25 -> inteiro 1
 
Pegue o restante 

0.25 * 2 = 0.5 -> inteiro 0 

0.5 *2 = 1 -> inteiro 1

...

0.101

Como dessa forma nao pode, tem que ter um 1 na esquerda

Mudamos o 1 para a esquerda assim ficando 2 ^-1

= 1.01

-1 + 127 = 126


126 em binario é

126/2 = 63 -> resto 0 
63/2 = 31 -> resto 1 
31/2 = 15 -> resto 1
15/2 = 7 -> resto 1
7/2 = 3 ->resto 1
3/2 = 1 -> resto 1
1/2 = 0 -> resto 1


01111110 -> como precisa ter 8 bits é adicionado um 0 a esquuerda



A parte fracionaria da normalizacao é 01

01000000000000000000000 -> preenchemos com 0 até 16 bits

Combinando tudo temos ...

0 01111110 01000000000000000000000

Agrupando em grupos de 4 .....

0011 1111 0010 0000 0000 0000 0000 0000

Em hexa seria:

0x3F200000

00
00
20
3F


double d = -2.375

Sinal (1 bit): 1 (negativo).

Expoente (11 bits): 10000000000 (1024 em decimal).

Mantissa (52 bits): 0010100000000000000000000000000000000000000000000000.

Em hexa : 0xC002C00000000000


char c = 17

Representação decimal: 17.

Representação hexadecimal: 0x11.


Resposta:

F1
FF
FF
FF
00
00
20
3F
00
00
00
00
C0
02
C0
00
11
PP
PP
PP
PP
PP
PP
PP



2)

prog1:

i -> U

sub -> t

printf -> U

calcula -> T

prog2:

i -> D

sub -> U 

calcula -> U

main -> T

b)

O gcc compila os dois arquivos .c e tambem faz a ligacao entre eles em uma unica etapa

Os simbolos que estao indefinidos em um modulo sao resolvidos na etapa de linkagem além de buscar definicoes nas biblioetcas padroes de C para funcoes como printf

Como todos os símbolos indefinidos em cada módulo encontram correspondentes em outro módulo ou na biblioteca padrão, a linkagem é concluída com sucesso.






