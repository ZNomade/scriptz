# =============================================================================
# Author: [=Zac|ZNômade=]
# Creation Date: 2024-06-30
# Last Modified: 2024-06-30
# Version: 1.0
# License: None
#
# Description:
# This script checks the HTTP STATUS of the provided links - checks if the link is valid.
#
# Usage:
# ./script_name.ps1 FILE_WITH_LINKS
#
# Parameters:
# FILE_WITH_LINKS - Files containing the links to be checked.
#
# Output:
# Shows the status code of the links provided
#
# Example Usage:
# ./script_name.ps1 Links.txt
#
# Notes:
# Make sure you have permissions for execution of PowerShell Scripts.
#
# To contribute to improving the script visit:
# https://github.com/ZNomade/scriptz/PowerShell
#
# Revision History:
# Version 1.0: 2024-06-30 - Initial version of the script.
#
# =============================================================================


# Verifica se o arquivo com as URLs foi fornecido como argumento
if ($args.Length -eq 0) {
    Write-Host "Uso: .\verifica_urls.ps1 <arquivo_com_urls>"
    exit 1
}

# Verifica se o arquivo existe
$filePath = $args[0]
if (-Not (Test-Path $filePath)) {
    Write-Host "Arquivo $filePath não encontrado!"
    exit 1
}

# Lê o arquivo linha por linha
Get-Content $filePath | ForEach-Object {
    $url = $_
    # Verifica se a linha não está vazia
    if (-Not [string]::IsNullOrWhiteSpace($url)) {
        # Faz a requisição HTTP e obtém o código de status
        try {
            $response = Invoke-WebRequest -Uri $url -UseBasicParsing -ErrorAction Stop
            $statusCode = $response.StatusCode
        } catch {
            $statusCode = $_.Exception.Response.StatusCode.Value__
        }
        Write-Host "URL: $url - Status: $statusCode"
    }
}
