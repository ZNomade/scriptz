# Script gerar senha aleatória
# Criado em 31/05/2024 by [=Zac|ZNômade=]

import random
import string

def gerar_senha(tamanho):
    caracteres = string.ascii_letters + string.digits + string.punctuation
    senha = ''.join(random.choice(caracteres) for _ in range(tamanho))
    return senha

def main():
    try:
        tamanho = int(input("Digite o número de caracteres para a senha: "))
        if tamanho <= 0:
            raise ValueError("O tamanho deve ser maior que zero.")
        senha = gerar_senha(tamanho)
        print(f"Sua senha aleatória é: {senha}")
    except ValueError as e:
        print(f"Entrada inválida: {e}")

if __name__ == "__main__":
    main()
