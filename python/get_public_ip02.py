# Script criado por [=Zac/ZNômade=] em 30/05/2024 - Versão 1.0

import requests
import sys

def get_public_ip(server_choice):
    servers = {
        1: "https://ifconfig.me",
        2: "https://icanhazip.com",
        3: "http://ipecho.net/plain",
        4: "https://ipinfo.io/ip",
        5: "https://api.ipify.org",
        6: "http://checkip.dyndns.org",
        7: "https://ident.me"
    }

    if server_choice in servers:
        try:
            response = requests.get(servers[server_choice])
            response.raise_for_status()  # Raise an error for bad status codes
            return response.text.strip()
        except requests.RequestException as e:
            return f"Erro ao acessar o servidor: {e}"
    else:
        print("Escolha inválida.")
        sys.exit()  # Encerra a execução do script


def main():
    print("Escolha um servidor para consultar o IP público:")
    print("1: ifconfig.me")
    print("2: icanhazip.com")
    print("3: ipecho.net/plain")
    print("4: ipinfo.io/ip")
    print("5: api.ipify.org")
    print("6: checkip.dyndns.org")
    print("7: ident.me")

    try:
        server_choice = int(input("Digite o número do servidor: "))
        ip_address = get_public_ip(server_choice)
        print(f"Seu IP público é: {ip_address}")
    except ValueError:
        print("Entrada inválida. Por favor, insira um número.")


if __name__ == "__main__":
    main()
