#!/bin/bash

# Script para mostrar os Top 10 comandos mais usados
# Criado em 10/03/2024 by [=Zac|ZNômade=]
# Versão 1.0a
# Obs.: O comando só funciona quando chamado via "source" = "source ./nome_do_comando.sh"

top10 (){
history | sort -k2 | uniq -c --skip-fields=1 | sort -r -g | head
}
top10