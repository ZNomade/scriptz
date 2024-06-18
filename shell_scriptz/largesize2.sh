#!/bin/bash
# =============================================================================
# Autor: [=Zac|ZNômade=]
# Data de Criação: 16/06/2024
# Versão: 1.0
# Licença: None
#
# Descrição:
# Versão enxuta do script que analisa um diretório fornecido pelo usuário e lista 
# os 10 maiores arquivos, com a opção de incluir ou não subdiretórios na análise.
#
# Uso:
# ./nome_do_script.sh DIR_PATH
#
# Parâmetros:
# DIR_PATH - O caminho do diretório a ser analisado.
#
# Saída:
# Lista os 10 maiores arquivos no diretório especificado, com seus tamanhos.
#
# Exemplo de Uso:
#./nome_do_script.sh /caminho/para/diretorio
#
# Notas:
# Certifique-se de ter permissões de leitura no diretório especificado.
#
# Histórico de Revisões:
# Versão 1.0: 16/06/2024 - Versão inicial do script.
# =============================================================================


# Função para identificar e exibir os 10 maiores arquivos
large() {

    # Verifica se o argumento foi passado
    if [ -z "$1" ]; then
        printf "Modo de usar: %s DIR_PATH, onde DIR_PATH é o caminho do diretório que se quer analisar.\n" "$0"
        exit 1

    else
        # Prompt para escolher a profundidade da pesquisa
        printf "Você quer realizar a pesquisa apenas no DIRETÓRIO(1) ou também nos SUBDIRETÓRIOS(2)?\n"
        read depth

        # Validação da entrada (somente números 1 ou 2)
        while [[ "$depth" != "1" && "$depth" != "2" ]]; do
            printf "Informe uma escolha válida! (1 ou 2)\n"
            read depth
        done

        # Executa a busca dos arquivos
        if [[ "$depth" == "1" ]]; then
            finding=$(find "$1" -maxdepth 1 -type f -exec du -h {} + | sort -rh | head -10)
            printf "Os 10 maiores arquivos em %s são:\n%s\n" "$1" "$finding"
            
        elif [[ "$depth" == "2" ]]; then
            finding=$(find "$1" -type f -exec du -h {} + | sort -rh | head -10)
            printf "Os 10 maiores arquivos no diretório %s, incluindo os subdiretórios, são:\n%s\n" "$1" "$finding"
        fi
    fi
}

# Chama a função principal no ínicio da execução do script
large "$1"
