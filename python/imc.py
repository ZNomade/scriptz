# Script simples para cálculo do IMC
# Criado em 23/05/2024 by [=Zac|ZNômade=]

peso = eval(input('Informe seu peso em Kg: '))
altura = eval(input('Informe sua altura em metros: '))
IMC = round(peso/(altura**2), 2)
print(f'Seu IMC é {IMC}')
