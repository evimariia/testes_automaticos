# Test Automation Script

Este repositório contém scripts para automação de testes em diferentes linguagens de programação (Python, C e C++). Inicialmente, o repositório inclui um script em Bash para sistemas Linux, e posteriormente será adicionado suporte para Windows com um script em PowerShell.

## Descrição

O script executa testes automatizados, comparando a saída gerada por programas escritos em Python, C ou C++ com saídas esperadas, fornecidas por arquivos de teste. Ele suporta compilação automática de código C e C++, bem como a execução de scripts Python. O resultado dos testes é apresentado no terminal e armazenado em um arquivo CSV.

## Funcionalidades

- **Detecção automática de linguagem**: O script reconhece a linguagem do arquivo de entrada com base na extensão (`.py`, `.c`, `.cpp`).
- **Compilação automática**: Para códigos em C e C++, o script realiza a compilação usando `gcc` ou `g++`.
- **Execução de testes**: O script executa o programa com entradas fornecidas por arquivos `.in` e compara a saída com arquivos `.out`.
- **Relatórios de teste**: Exibe os resultados de cada teste (sucesso ou falha) e gera um relatório final, com os dados armazenados em um arquivo CSV.
- **Suporte a cores configuráveis**: O feedback visual dos resultados (sucesso e falha) é exibido em cores configuráveis por um arquivo JSON.

## Utilização

### Requisitos

- **Linux** (ou Windows com suporte ao Windows Subsystem for Linux - WSL).
- **Ferramentas de compilação**: `gcc` e `g++` para programas C/C++.
- **Python**: Versão 3.x para execução de scripts Python.
- **jq**: Ferramenta para manipulação de arquivos JSON.

### Executando o script

1. Coloque o código que você deseja testar em um arquivo com as extensões suportadas (`.py`, `.c`, `.cpp`).
2. Prepare os arquivos de entrada e saída no formato:
   - Arquivos de entrada: `.in`
   - Arquivos de saída esperada: `.out`
   