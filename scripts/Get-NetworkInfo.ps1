param([string]$OutputPath = "./network-info.json")
# Read-only network inventory; no configuration changes are made.
$adapters = Get-NetAdapter -ErrorAction SilentlyContinue | Select-Object Name,Status,LinkSpeed,MacAddress
$config = Get-NetIPConfiguration -ErrorAction SilentlyContinue | Select-Object InterfaceAlias,IPv4Address,IPv4DefaultGateway,DNSServer
$result = [pscustomobject]@{ CollectedAt=(Get-Date).ToUniversalTime().ToString("o"); Adapters=$adapters; Configuration=$config; Simulation=$false }
$result | ConvertTo-Json -Depth 6 | Set-Content -Path $OutputPath -Encoding UTF8
$result
