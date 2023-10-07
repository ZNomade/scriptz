#!/bin/bash
# Script criado por [=Zac/ZNômade=] em 07/10/2023
# Shell script para consulta de ip público, versão 1.0a

# Lista de servidores para consulta de IP público
servers=(
  "ifconfig.me"
  "icanhazip.com"
  "ipinfo.io/ip"
#  "api.ipify.org"         # server não funcional na versão atual
#  "checkip.dyndns.org"    # server não funcional na versão atual
#  "ident.me"              # server não funcional na versão atual 
#  "bot.whatismyipaddress.com"    # server não funcional na versão atual
  "ipecho.net/plain"
)

# Imprime a lista de servidores com números
echo "Escolha um servidor para consulta de IP público (1-8):"
for i in {1..4}; do
  echo "  ${i}. ${servers[i-1]}"
done
read server_number

# Verifica se o número é válido
if [[ ${server_number} -gt 8 || ${server_number} -lt 1 ]]; then
  echo "Número inválido."
  exit 1
fi

# Obtém o servidor selecionado
server="${servers[${server_number}-1]}"

# Realiza a consulta
#curl -s "${server}" | grep -oP '(?<=IP: ).*' <= comando precisa ser melhorado, não retorna resultado
publicip=$(curl -s "${server}")  #substituindo c comando não funcional anterior
echo IP: $publicip

# Imprime o nome do servidor na saída
echo "Servidor: ${server}"


# Fim do script
