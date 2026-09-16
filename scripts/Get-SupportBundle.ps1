param([string]$OutputDirectory = "./support-bundle")
# Safe collection orchestrator. It collects diagnostic information only.
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
& "$PSScriptRoot/Get-SystemHealth.ps1" -OutputPath "$OutputDirectory/system-health.json" | Out-Null
& "$PSScriptRoot/Get-NetworkInfo.ps1" -OutputPath "$OutputDirectory/network-info.json" | Out-Null
Get-Service | Select-Object Name,Status,StartType | ConvertTo-Json | Set-Content "$OutputDirectory/services.json" -Encoding UTF8
Get-WinEvent -LogName System -MaxEvents 25 -ErrorAction SilentlyContinue | Select-Object TimeCreated,Id,LevelDisplayName,ProviderName,Message | ConvertTo-Json -Depth 4 | Set-Content "$OutputDirectory/system-events.json" -Encoding UTF8
Write-Output "Support bundle written to $OutputDirectory"
