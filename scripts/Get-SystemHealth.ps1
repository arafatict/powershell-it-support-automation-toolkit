param([string]$OutputPath = "./system-health.json")
# Safe read-only system health collection for an authorised lab endpoint.
$ErrorActionPreference = "Stop"
$os = Get-CimInstance Win32_OperatingSystem
$computer = Get-CimInstance Win32_ComputerSystem
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID,@{N="FreeGB";E={[math]::Round($_.FreeSpace/1GB,2)}},@{N="SizeGB";E={[math]::Round($_.Size/1GB,2)}}
$result = [pscustomobject]@{ CollectedAt=(Get-Date).ToUniversalTime().ToString("o"); ComputerName=$computer.Name; OS=$os.Caption; Version=$os.Version; LastBoot=$os.LastBootUpTime; MemoryGB=[math]::Round($computer.TotalPhysicalMemory/1GB,2); Disks=$disks; Simulation=$false }
$result | ConvertTo-Json -Depth 5 | Set-Content -Path $OutputPath -Encoding UTF8
$result
