# ------------------------------------------------------------------------------
# Script:      monitorrede.ps1
# Finalidade:  Monitora se interface de rede especifica está online
# Autor:       [=ZNomâde=] | Versão: 1.0.0 | Data: 2026-10-27
# ------------------------------------------------------------------------------

$NomeInterface = "Ethernet" # Substitua pelo nome do adaptador que quer monitorar

Write-Host "Monitorando o adaptador '$NomeInterface'..." -ForegroundColor Cyan

while ($true) {
    $Adaptador = Get-NetAdapter -Name $NomeInterface -ErrorAction SilentlyContinue

    if ($Adaptador.Status -ne "Up") {
        $Hora = Get-Date -Format "HH:mm:ss"
        Write-Host "`n[$Hora] ALERTA CRÍTICO: O adaptador '$NomeInterface' caiu! (Status: $($Adaptador.Status))" -ForegroundColor Red
        
        # Usa o sintetizador de voz nativo do Windows para "falar" que a conexão caiu
        Add-Type -AssemblyName System.Speech
        (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak("Atention, the network is offline - link is dead!.") # Substitua pela frase de alerta de sua preferência
    }

    Start-Sleep -Seconds 3
}