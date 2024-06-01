#!/bin/bash

# Script para buscar ocorrências de um comando no histórico de comandos do shell
# Criado em 09/03/2024 by [=Zac|ZNômade=]
# Versão 1.0a
# Obs.: O comando só funciona quando chamado via "source" = "source ./nome_do_comando.sh"

#Solicitando o nome do comando a ser buscado
echo "Script utilizado para busca de comandos executados que se encontran no HISTORY do shell"
echo "Digite o nome do comando que quer buscar. Se digitar somente as primeiras letras do nome do comando, serão exibidos todos os comandos que possuem as letras informadas no início do nome."
read comando

#Executando a busca


history | cut -c8- | grep '^'$comando'' | nl | awk '{print $1, $2, $3, $4, $5}' | less

# Verificando se o comando foi encontrado

# if [ $? -eq 1 ]; then
#   echo "O comando '$comando' não foi encontrado no histórico."
# fi