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


# Checks if the file with URLs was given as an argument
if ($args.Length -eq 0) {
    Write-Host "Usage: ./script_name.ps1 <file_with_urls>"
    exit 1
}

# Check if file exists
$filePath = $args[0]
if (-Not (Test-Path $filePath)) {
    Write-Host "File $filePath not found!"
    exit 1
}

# Read the file line by line
Get-Content $filePath | ForEach-Object {
    $url = $_
    # Checks if the line is not empty
    if (-Not [string]::IsNullOrWhiteSpace($url)) {
        # Makes the HTTP request and gets the status code
        try {
            $response = Invoke-WebRequest -Uri $url -UseBasicParsing -ErrorAction Stop
            $statusCode = $response.StatusCode
        } catch {
            $statusCode = $_.Exception.Response.StatusCode.Value__
        }
        Write-Host "URL: $url - Status: $statusCode"
    }
}
