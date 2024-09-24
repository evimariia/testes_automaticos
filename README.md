# Atividade de Testes Automatizados
- Graduação em Engenharia da Computação do Centro Universitário SENAI CIMATEC
- Disciplina: Fundamento de Programação de Sistemas
- Docente: Ariel Menezes
- Grupo: Bruno da Costa Sales, Évila Maria de Souza Carneiro, Gabriel Batista Reis, João Victor Borges Lima

## Objetivo
Desenvolver um script bash e um em powershell para testes automatizados de códigos escritos em linguagens de programação Python, C e C++. O script deverá ser capaz de identificar dinamicamente a linguagem do código submetido pelo usuário, compilar (quando necessário), executar o código e comparar a saída gerada com uma lista de saídas esperadas.

## Especificações Técnicas:

### Entrada de Código:

O usuário deve executar seu script passando flags com o caminho para um arquivo com um código-fonte em Python/C/C++ e o caminho para uma pasta com os arquivos de entrada e saídas esperadas.
Ex.: ./test.sh --input ./exemplo/main.py --tests ./exemplo/tests/
Ex.: ./test.sh -i ./exemplo/main.py -t ./exemplo/tests/
A linguagem deverá ser identificada automaticamente com base na extensão do arquivo:
- .py para Python.
- .c para C.
- .cpp para C++.

## Compilação e Execução:

Caso a linguagem submetida seja C ou C++, o código deve ser compilado antes da execução utilizando ferramentas apropriadas (por exemplo, gcc para C e g++ para C++).
Para código em Python, não há necessidade de compilação, apenas execução direta.
O sistema deverá então executar o código passando como entrada uma série de arquivos de input pré-definidos (ex.: 1.in, 2.in, etc.).
Cada arquivo de input será utilizado em uma execução separada do código.
Comparação de Saídas:

Após a execução, o sistema deverá comparar a saída gerada pelo código com os arquivos que contêm as saídas esperadas (ex.: 1.out, 2.out, etc.).
A comparação será feita linha por linha, levando em consideração espaços e formatações (ou outra estratégia de verificação definida pela equipe, como normalização de espaços em branco).
O sistema deve indicar se a saída está correta ou incorreta para cada teste.
Resultado Final:

Seupt scri deve retornar para o usuário um relatório com o resultado de cada teste, informando se o código passou ou não em cada caso.
Se o código falhar em algum teste, o relatório deve incluir informações sobre qual teste falhou e qual foi a diferença entre a saída gerada e a esperada. 
Seu script deve fazer um registro em arquivo de texto CSV de todas as vezes que ele é executado (salvar todos os parâmetros que recebeu, quantos testes rodou, quantos passaram, quantos falharam e quantos deram erro).
Exemplo de Funcionamento:

O usuário submete um arquivo main.py.
O sistema identifica que o arquivo está em Python, prepara a execução.
Para cada arquivo de input, o sistema executa python main.py < input_file > output_file.
O sistema compara output_file com o arquivo correspondente da lista de saídas esperadas (para o arquivo de entrada 1.in, comparar a saída com o arquivo de saída esperada 1.out).
O sistema gera um relatório indicando se as saídas estão corretas ou não (mostrar na tela "Sucesso" ou "Falha" para cada output diferente do output esperado).
Recursos e Ferramentas:

Linguagens: Bash e Powershell (para implementar a solução); Python, C e C++ (para os códigos de teste).
Ferramentas de compilação: gcc e g++ para C/C++.
Comparação de saídas: Ferramentas de comparação de strings ou arquivos (ex.: diff).
Utilizar arquivo JSON para configuração do software. Ex.: No arquivo JSON deve haver uma opção para configuração de cores de texto de sucesso, falha, erro, etc. Adicionar variável para definir um limite de testes com erro para parar a execução dos testes.
Entrega e Avaliação:

A entrega deve ser um repositório github com um README.md descritivo, código fonte (em bash e powershell) e códigos de teste com suas entradas e saídas esperadas;
O código deve ser bem documentado e estruturado, com comentários explicando as funções principais.
Pode ser interessante implementar, se possível, um padrão de projeto para tornar seu código extensível para utilização com outras linguagens (ex.: padrão strategy: estender seu código para aceitar uma nova linguagem necessitaria apenas implementar a função de compilação+execução do código, sem necessidade de reimplementar demais funções).
Testes devem ser realizados com diversos exemplos de código nas três linguagens (Python, C e C++).
A avaliação será baseada na precisão dos testes, na clareza do código e no funcionamento correto da plataforma em diversos cenários de entrada e saída.
Adicione vídeos curtos ao seu README.md exemplificando a execução.
