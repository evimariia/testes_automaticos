#!/bin/bash

# Carregar configurações do arquivo JSON
CONFIG_FILE="config.json"
SUCCESS_COLOR="\033[0;32m" # Verde
FAILURE_COLOR="\033[0;31m"  # Vermelho
RESET_COLOR="\033[0m"       # Reset

# Função para carregar configurações do JSON
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        SUCCESS_COLOR=$(jq -r '.colors.success' $CONFIG_FILE)
        FAILURE_COLOR=$(jq -r '.colors.failure' $CONFIG_FILE)
    fi
}

# Função para compilar código C/C++
compile_code() {
    case "$1" in
        *.c) gcc "$1" -o "${1%.c}" ;;
        *.cpp) g++ "$1" -o "${1%.cpp}" ;;
    esac
}

# Função para comparar saídas
compare_outputs() {
    diff -q "$1" "$2" >/dev/null
    return $?
}

# Processar argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -i|--input) input_file="$2"; shift ;;
        -t|--tests) tests_dir="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Verificar se os arquivos foram passados
if [[ -z "$input_file" || -z "$tests_dir" ]]; then
    echo "Uso: $0 -i <caminho_do_codigo> -t <caminho_dos_testes>"
    exit 1
fi

# Identificar a linguagem do código
case "$input_file" in
    *.py) language="python";;
    *.c) language="c";;
    *.cpp) language="cpp";;
    *) echo "Linguagem não suportada"; exit 1 ;;
esac
#base_name=$(basename "$input_file" .cpp)
# Carregar as configurações
load_config

# Compilar o código se necessário
if [[ "$language" == "c" || "$language" == "cpp" ]]; then
    compile_code "$input_file"
    if [[ $? -ne 0 ]]; then
        echo -e "${FAILURE_COLOR}Compilação falhou!${RESET_COLOR}"
        exit 1
    fi
fi

# Contadores de teste
total_tests=0
passed_tests=0
failed_tests=0

# Executar os testes
for test_file in "$tests_dir"/*.in; do
    base_name=$(basename "$test_file" .in)
    expected_output_file="$tests_dir/$base_name.out"
    output_file="$tests_dir/$base_name.tmp"

    # Executar o código
    case "$language" in
        python) python3 "$input_file" < "$test_file" > "$output_file" ;;
        c) "./${input_file%.c}" < "$test_file" > "$output_file" ;;
        cpp) "./${input_file%.cpp}" < "$test_file" > "$output_file" ;;
    esac

    # Comparar saídas
    total_tests=$((total_tests + 1))
    if compare_outputs "$output_file" "$expected_output_file"; then
        echo -e "${SUCCESS_COLOR}Teste $base_name: Sucesso${RESET_COLOR}"
        passed_tests=$((passed_tests + 1))
    else
        echo -e "${FAILURE_COLOR}Teste $base_name: Falha${RESET_COLOR}"
        failed_tests=$((failed_tests + 1))
        diff "$output_file" "$expected_output_file"
    fi

    # Limpeza do arquivo temporário
    rm "$output_file"
done

# Gerar relatório
echo "Resultados finais: $total_tests testes executados, $passed_tests passaram, $failed_tests falharam."

# Registrar em CSV
echo "$(date),$input_file,$tests_dir,$total_tests,$passed_tests,$failed_tests" >> resultados.csv
