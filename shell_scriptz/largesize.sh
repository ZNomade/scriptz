#!/bin/bash
#
# Script para mostrar os 10 maiores arquivos existentes em um PATH
# Uso: ./nome_do_script DIR_PATH
# Versão inicial 
# 
# 
# Criado em 02/06/2024 by [=Zac|ZNômade=]


large()
{
    if [ -z "$1" ];
    then
	printf "Modo de usar: %s DIR_PATH, onde DIR_PATH é o caminho do diretório que se quer analisar.\n" "$0"
	exit 1
    else
	printf "Você quer realizar a pesquisa apenas no DIRETÓRIO(1) ou também nos SUBDIRETÓRIOS(2)?\n "
	read depth

	 loop1()
	       {
		   while [[ "$depth" != "1" && "$depth" != "2" ]]
		     do
            		printf "Informe uma escolha válida!(1 ou 2)\n "
			read depth
		   done
		   case "$depth" in
		       1) finding=`find "$1" -maxdepth 1 -type f -exec du -h {} + | sort -rh | head -10`
                          printf "Os 10 maiores arquivos em %s são: \n%s\n " "$1" "$finding"
                          ;;

		       2) finding=`find "$1" -type f -exec du -h {} + | sort -rh | head -10`
			  printf "Os 10 maiores arquivos no diretório %s , incluindo os subdiretórios são: \n%s\n" "$1" "$finding"
			  ;;
		   esac
		   exit 0
		       
		   }

	 if [[ "$depth" =~ ^[0-9]+$ ]];
	   then
	        loop1 "$1"
	 else
	     printf "Informe um valor numérico para escolher a opção!\n "
	     read depth
	     while [[ ! "$depth" =~ ^[0-9]+$ ]]
	       do
		      printf "Informe um valor numérico para escolher a opção!\n "
		      read depth
		   done   
	     loop1 "$1"
	   fi
    fi
    }

    large "$@"
		
	
