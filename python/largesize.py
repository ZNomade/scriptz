#!/usr/bin/env python3
# =============================================================================
# Author: [=Zac|ZNômade=]
# Creation Date: 2024-06-06
# Last Modified: 2024-06-22
# Version: 1.0
# License: None
#
# Description:
# This script analyzes a directory provided by the user and lists the top 10
# largest files, with the option to include or exclude subdirectories.
#
# Usage:
# ./my_script.sh DIR_PATH
#
# Parameters:
# DIR_PATH - The path of the directory to be analyzed.
#
# Output:
# Lists the top 10 largest files in the specified directory with their sizes.
#
# Example Usage:
# ./my_script.sh /path/to/directory
#
# Notes:
# Make sure you have read permissions for the specified directory.
#
# Revision History:
# Version 1.0: 2024-06-06 - Initial version of the script.
# Version 1.0: 2024-06-22 - Fixed command string handling and the way files and 
# sizes are extracted and sorted.
# =============================================================================


import os
import sys
import subprocess

def print_usage(script_name):
    print(f"Modo de usar: {script_name} DIR_PATH, onde DIR_PATH é o caminho do diretório que se quer analisar.")

def get_largest_files(dir_path, include_subdirs):
    if include_subdirs:
        command = f'find {dir_path} -type f -exec du -h {{}} + | sort -hr | head -n 10'
    else:
        command = f'find {dir_path} -maxdepth 1 -type f -exec du -h {{}} + | sort -hr | head -n 10'

    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Erro ao executar o comando find: {result.stderr}")
        sys.exit(1)

    files = result.stdout.strip().split('\n')
    largest_files = [line.split('\t') for line in files]

    for file in largest_files:
        print(file[0], '\t', file[1])

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print_usage(sys.argv[0])
        sys.exit(1)

    dir_path = sys.argv[1]

    if not os.path.isdir(dir_path):
        print(f"O caminho fornecido '{dir_path}' não é um diretório válido.")
        sys.exit(1)

    depth = input("Você quer realizar a pesquisa apenas no DIRETÓRIO(1) ou também nos SUBDIRETÓRIOS(2)? ")

    while depth not in {'1', '2'}:
        print("Informe uma escolha válida (1 ou 2).")
        depth = input("Você quer realizar a pesquisa apenas no DIRETÓRIO(1) ou também nos SUBDIRETÓRIOS(2)? ")

    include_subdirs = (depth == '2')
    get_largest_files(dir_path, include_subdirs)
