### Código de Máquina e Assembly

- Código de Máquina: Entendeu como os bytes do código de máquina representam instruções específicas do processador, incluindo mov, call, e ret

- Desassembly: Usou ferramentas como objdump para inspecionar e entender o código de máquina gerado a partir de Assembly.

- Little-Endian: Aprendeu a lidar com representação de valores em little-endian, como o deslocamento na instrução call.


### Relocação e Linkedição

- Deslocamento em Instruções call: Viu como o montador insere valores "placeholder" e como o linkeditor ajusta esses valores para o endereço correto durante a linkedição.

- Cálculo de Deslocamento Manual: Aprendeu a calcular o deslocamento relativo entre instruções e endereços em tempo de execução.


### Ferramentas e Debug

- GCC e Flags Especiais: Usou -Wa,--execstack para permitir execução na pilha.

- Diagnóstico com objdump: Analisou arquivos objeto para verificar código gerado.

- Depuração de Erros: Identificou e corrigiu problemas como segmentation faults e deslocamentos incorretos.
