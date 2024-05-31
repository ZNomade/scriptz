# Script criado por [=Zac/ZNômade=] em 30/05/2024 - Versão 1.0
#
# Definindo variável Global

url_servidores = {
    "ifconfig.me": "https://ifconfig.me",
    "icanhazip.com": "https://icanhazip.com",
    "ipinfo.io/ip": "https://ipinfo.io/ip",
    "api.ipify.org": "https://api.ipify.org",
    "checkip.dyndns.org": "https://checkip.dyndns.org",
    "ident.me": "https://ident.me",
    "ipecho.net/plain": "http://ipecho.net/plain",
}
import requests


def obter_ip_publico(servidor):
    """
    Função que consulta e retorna o IP público da máquina usando o servidor especificado.

    Argumentos:
      servidor (str): Nome do servidor de consulta (ifconfig.me, icanhazip.com, etc.).

    Retorno:
      str: O IP público da máquina, ou None se a consulta falhar.
    """

    global url_servidores
    try:
        if servidor not in url_servidores:
            raise ValueError(f"Servidor inválido: {servidor}")

        resposta = requests.get(url_servidores[servidor])
        if resposta.status_code == 200:
            return resposta.text.strip()
        else:
            print(f"Erro ao consultar IP público no servidor {servidor}: {resposta.status_code}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"Erro ao consultar IP público no servidor {servidor}: {e}")
        return None


def main():
    """
    Função principal que executa o script.
    """
    global url_servidores
    while True:
        print("\nEscolha um servidor de consulta:")
        for i, servidor in enumerate(url_servidores.keys()):
            print(f"{i + 1}. {servidor}")

        try:
            opcao_servidor = int(input("Digite o número da opção: ")) - 1
            if 0 <= opcao_servidor < len(url_servidores):
                break
            else:
                print("Opção inválida. Tente novamente.")
        except ValueError:
            print("Entrada inválida. Digite um número inteiro.")

    servidor_escolhido = list(url_servidores.keys())[opcao_servidor]
    ip_publico = obter_ip_publico(servidor_escolhido)

    if ip_publico:
        print(f"\nSeu IP público no servidor {servidor_escolhido} é: {ip_publico}")
    else:
        print("\nFalha ao obter IP público.")


if __name__ == "__main__":
    main()
