param([string]$ExtensionsRoot = (Join-Path $env:APPDATA 'TeamSpeak\Default\extensions'), [switch]$DryRun)
$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath($ExtensionsRoot)
$target = [IO.Path]::GetFullPath((Join-Path $root 'gg.ocb.obsidian'))
if ([IO.Path]::GetDirectoryName($target) -ne $root.TrimEnd('\')) { throw 'Zielpfadpruefung fehlgeschlagen.' }
if (-not (Test-Path -LiteralPath $target)) { Write-Output 'OCB-Theme nicht installiert.'; exit 0 }
$meta = Get-Content -LiteralPath (Join-Path $target 'package.json') -Raw | ConvertFrom-Json
if ($meta.identifier -ne 'gg.ocb.obsidian') { throw 'Unbekannter Ordnerinhalt. Abbruch.' }
if ($DryRun) { Write-Output "Geprueft. Nur dieses Theme wird deaktiviert: $target"; exit 0 }
$backupRoot = Join-Path ([IO.Directory]::GetParent($root).FullName) 'ocb-theme-backups'
New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
$backup = Join-Path $backupRoot ('gg.ocb.obsidian-disabled-' + [DateTime]::Now.ToString('yyyyMMdd-HHmmss-fff'))
Move-Item -LiteralPath $target -Destination $backup
Write-Output "Theme entfernt und gesichert: $backup"
