param([string]$ExtensionsRoot = (Join-Path $env:APPDATA 'TeamSpeak\Default\extensions'), [switch]$DryRun)
$ErrorActionPreference = 'Stop'
$identifier = 'gg.ocb.obsidian'
$source = Join-Path $PSScriptRoot $identifier
$meta = Get-Content -LiteralPath (Join-Path $source 'package.json') -Raw | ConvertFrom-Json
if ($meta.identifier -ne $identifier) { throw 'Ungueltige Paketkennung.' }
$root = [IO.Path]::GetFullPath($ExtensionsRoot)
$target = [IO.Path]::GetFullPath((Join-Path $root $identifier))
if ([IO.Path]::GetDirectoryName($target) -ne $root.TrimEnd('\')) { throw 'Zielpfadpruefung fehlgeschlagen.' }
foreach ($rel in @('package.json','obsidian-rc15.css','preview.png','assets\glass-4k.webp','assets\header.webp','assets\bigcircle.webp')) {
 if (-not (Test-Path -LiteralPath (Join-Path $source $rel) -PathType Leaf)) { throw "Datei fehlt: $rel" }
}
foreach ($asset in Get-ChildItem -LiteralPath $source -Recurse -File) {
 if ($asset.Length -gt 2097152) { throw "TS6 limit exceeded (2 MiB): $($asset.Name)" }
}
if ($DryRun) { Write-Output "Geprueft. Installationsziel: $target"; exit 0 }
New-Item -ItemType Directory -Path $root -Force | Out-Null
$stage = Join-Path $root ($identifier + '-staging-' + [Guid]::NewGuid().ToString('N'))
Copy-Item -LiteralPath $source -Destination $stage -Recurse
foreach ($file in Get-ChildItem -LiteralPath $source -Recurse -File) {
 $relative = $file.FullName.Substring($source.Length).TrimStart('\')
 $copy = Join-Path $stage $relative
 if ((Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $copy).Hash) { throw "Kopierpruefung fehlgeschlagen: $relative" }
}
$backup = $null
if (Test-Path -LiteralPath $target) {
 $backupRoot = Join-Path ([IO.Directory]::GetParent($root).FullName) 'ocb-theme-backups'
 New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
 $backup = Join-Path $backupRoot ($identifier + '-' + [DateTime]::Now.ToString('yyyyMMdd-HHmmss-fff'))
 Move-Item -LiteralPath $target -Destination $backup
 Write-Output "Vorherige Version gesichert: $backup"
}
try { Move-Item -LiteralPath $stage -Destination $target }
catch {
 if ($backup -and -not (Test-Path -LiteralPath $target)) { Move-Item -LiteralPath $backup -Destination $target }
 throw
}
Write-Output 'Installiert. TeamSpeak starten, Themes aktualisieren und OCB Obsidian Glass auswaehlen.'
