@echo off
rem Script criado por [=Zac/ZNômade=] em 31/05/2024

setlocal enabledelayedexpansion

rem Lista de servidores para consulta de IP público
set server1=ifconfig.me
set server2=icanhazip.com
set server3=ipinfo.io/ip
set server4=api.ipify.org
set server5=checkip.dyndns.org
set server6=ident.me
set server7=bot.whatismyipaddress.com
set server8=ipecho.net/plain

rem Imprime a lista de servidores com números
echo Escolha um servidor para consulta de IP público (1-8):
for /l %%i in (1,1,8) do (
  set server=!server%%i!
  echo %%i. !server!
)

rem Lê a seleção do usuário
set /p server_number=

rem Verifica se o número é válido
if "!server_number!"=="" (
  echo Número inválido.
  exit /b 1
)
if !server_number! gtr 8 (
  echo Número inválido.
  exit /b 1
)
if !server_number! lss 1 (
  echo Número inválido.
  exit /b 1
)

rem Obtém o servidor selecionado
set server=!server%server_number%!

rem Realiza a consulta
curl -s !server!
