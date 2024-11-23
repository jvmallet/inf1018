# Repositorio INF1018 -> Software Básico 2024.2


## Compilar, Linkar e Rodar Assembly em ARM64 no macOS (Apple Silicon)

Este guia explica como configurar, compilar e executar programas em Assembly ARM64 no macOS com chips Apple Silicon.

Primeiramente, se você tiver um código Assembly originalmente escrito para x86_64, será necessário traduzi-lo para ARM64

Logo após ...

Use o clang para compilar e linkar o programa. Adicione as seguintes opções ao comando para garantir compatibilidade:

-target arm64-apple-macos: Define explicitamente o target ARM64 no macOS.
-nostartfiles: Evita a inclusão do código de inicialização padrão.
-e _start: Define o ponto de entrada para _start.

Segue comando para compilar e linkar:

- clang -target arm64-apple-macos -nostartfiles -e _start -o test test.s

Após a compilação, execute o programa gerado:

- ./test

Para verificar o código de saída:

- echo $? 

