#!/bin/bash

# Script para cópia de arquivos usando um arquivo txt como fonte
# Created in 10/03/2024 | By ZNômade
# Version 1.0a
#
# Para utilizar o script substitua as váriaveis ARQUIVO_ORIGEM e DIRETORIO_DESTINO com seus próprios dados!


# Nome do arquivo de texto com os caminhos dos arquivos de origem

ARQUIVO_ORIGEM="/c/Users/Zac/Music/EDM003.txt"

# Diretório de destino

DIRETORIO_DESTINO="/c/Users/Zac/Music/Test"

# Verifica se o arquivo de origem existe
if [ ! -f "$ARQUIVO_ORIGEM" ]; then
  echo "O arquivo '$ARQUIVO_ORIGEM' não existe."
  exit 1
fi

# Verifica se o diretório de destino existe
if [ ! -d "$DIRETORIO_DESTINO" ]; then
  echo "O diretório '$DIRETORIO_DESTINO' não existe."
  exit 1
fi

# Lê cada linha do arquivo de origem
while read -r linha; do
  # Verifica se a linha não está vazia
  if [ ! -z "$linha" ]; then
    # Copia o arquivo para o diretório de destino
    cp "$linha" "$DIRETORIO_DESTINO"

    # Exibe uma mensagem de sucesso
    echo "O arquivo '$linha' foi copiado para '$DIRETORIO_DESTINO'."
  fi
done < "$ARQUIVO_ORIGEM"

# Exibe uma mensagem de sucesso final
echo "Todos os arquivos foram copiados com sucesso!"
