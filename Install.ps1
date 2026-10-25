param([string]$ExtensionsRoot = (Join-Path $env:APPDATA 'TeamSpeak\Default\extensions'), [switch]$DryRun)
$ErrorActionPreference = 'Stop'
$identifier = 'gg.ocb.obsidian'
$source = Join-Path $PSScriptRoot $identifier
foreach ($required in @('gg.ocb.obsidian\package.json','Verify-Package.ps1')) {
 if (-not (Test-Path -LiteralPath (Join-Path $PSScriptRoot $required) -PathType Leaf)) {
  throw "Installationspaket unvollstaendig: $required fehlt. ZIP per 'Alle extrahieren' vollstaendig in einen neuen Ordner entpacken. Nicht aus der ZIP starten."
 }
}
Write-Output ("Windows-Benutzer: " + [Environment]::UserName)
Write-Output ("Erweiterungsordner: " + $ExtensionsRoot)
Write-Output 'Bei abweichendem TS6-Profil: Einstellungen > Erscheinungsbild > Verzeichnis fuer Erweiterungen oeffnen und Ziel vergleichen.'
$meta = Get-Content -LiteralPath (Join-Path $source 'package.json') -Raw | ConvertFrom-Json
if ($meta.identifier -ne $identifier) { throw 'Ungueltige Paketkennung.' }
$root = [IO.Path]::GetFullPath($ExtensionsRoot)
$target = [IO.Path]::GetFullPath((Join-Path $root $identifier))
if ([IO.Path]::GetDirectoryName($target) -ne $root.TrimEnd('\')) { throw 'Zielpfadpruefung fehlgeschlagen.' }
foreach ($rel in @('package.json','obsidian.css','preview.png','assets\glass-4k.webp','assets\header.webp','assets\bigcircle.webp')) {
 if (-not (Test-Path -LiteralPath (Join-Path $source $rel) -PathType Leaf)) { throw "Datei fehlt: $rel" }
}
foreach ($asset in Get-ChildItem -LiteralPath $source -Recurse -File) {
 if ($asset.Length -gt 2097152) { throw "TS6 limit exceeded (2 MiB): $($asset.Name)" }
}
Write-Output ("Neue Version: " + $meta.version)
$installedManifest = Join-Path $target 'package.json'
if (Test-Path -LiteralPath $installedManifest) {
 $installedMeta = Get-Content -LiteralPath $installedManifest -Raw | ConvertFrom-Json
 Write-Output ("Installierte Version: " + $installedMeta.version)
} else { Write-Output 'Noch kein OCB-Theme an diesem Ziel installiert.' }
& (Join-Path $PSScriptRoot 'Verify-Package.ps1')
if (-not $DryRun -and (Get-Process -Name TeamSpeak -ErrorAction SilentlyContinue)) {
 throw 'TeamSpeak 6 ist noch geoeffnet. Bitte vollstaendig beenden und den Installer erneut starten. Es wurde nichts ersetzt.'
}
if ($DryRun) { Write-Output "Geprueft. Installationsziel: $target"; exit 0 }
New-Item -ItemType Directory -Path $root -Force | Out-Null
$stage = Join-Path $root ($identifier + '-staging-' + [Guid]::NewGuid().ToString('N'))
if ([IO.Path]::GetDirectoryName([IO.Path]::GetFullPath($stage)) -ne $root.TrimEnd('\')) { throw 'Stage path validation failed.' }
try {
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
} finally {
 if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
}
Write-Output ''
Write-Output ('ERFOLGREICH INSTALLIERT: ' + $meta.name)
Write-Output ('Installiert. Ziel: ' + $target)
Write-Output 'Naechster Schritt: TeamSpeak 6 starten > Einstellungen > Erscheinungsbild.'
Write-Output 'Benutzer-Theme aktivieren, Liste aktualisieren und das aktuelle OCB-Paket anklicken.'
Write-Output 'Darunter die Variante OCB.GG - Glass & Dark auswaehlen.'
Write-Output 'ZIP und entpackten Installationsordner erst entfernen, wenn das Theme funktioniert.'
