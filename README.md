# PowerShell IT Support Automation Toolkit

A safe, read-only PowerShell toolkit for common IT Support information collection.

## Live showcase

LIVE_URL_PLACEHOLDER

## Scripts

- `Get-SystemHealth.ps1` — OS, computer, memory, boot and disk information.
- `Get-NetworkInfo.ps1` — adapters, IP configuration, gateway and DNS information.
- `Get-SupportBundle.ps1` — combines health, network, services and recent System events.
- `Get-InstalledSoftware.ps1` — read-only installed software inventory.

## Usage

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\Get-SystemHealth.ps1
.\scripts\Get-NetworkInfo.ps1
.\scripts\Get-SupportBundle.ps1
.\scripts\Get-InstalledSoftware.ps1
```

## Safety

Read-only by design. No passwords, tokens, destructive actions or real client data. Use only on authorised lab endpoints.

## What it demonstrates

PowerShell scripting, Windows diagnostics, storage/network/service/event-log inventory, support-bundle collection and safe automation.

## Limitations

Scripts require an authorised Windows environment and are not represented as production employer work.

## Repository

REPO_URL_PLACEHOLDER
