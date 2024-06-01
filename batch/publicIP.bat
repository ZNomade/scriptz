@echo off

rem Script bat para exibir o IP público
rem Criado em 16/03/2024 by [=Zac|ZNômade=]
rem Versão 1.0a

rem Define a variável com o URL do serviço "ifconfig.me"
set URL="https://ifconfig.me"

rem Usa o comando "curl" para obter o conteúdo do URL
for /f "delims=" %%a in ('curl -s %URL%') do (
  rem Exibe o IP público
  echo Seu IP público: %%a

  rem Pausa por 10 segundos
  timeout /t 10 >nul

  rem Limpa a tela
  cls
)

rem Volta para o prompt do CMD
pause
