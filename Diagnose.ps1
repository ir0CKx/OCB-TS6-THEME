param([string]$ExtensionsRoot = (Join-Path $env:APPDATA 'TeamSpeak\Default\extensions'))
$ErrorActionPreference = 'Stop'
Write-Output 'OCB.GG - Installationsdiagnose (nur lesen, keine Aenderungen)'
Write-Output ("Windows-Benutzer: " + [Environment]::UserName)
Write-Output ("Geprueftes Ziel: " + $ExtensionsRoot)
Write-Output 'Dieses Ziel mit TS6 > Einstellungen > Erscheinungsbild > Verzeichnis fuer Erweiterungen oeffnen vergleichen.'
if (-not (Test-Path -LiteralPath $ExtensionsRoot -PathType Container)) {
 Write-Output 'HINWEIS: Dieser Erweiterungsordner existiert noch nicht. TS6 einmal starten oder den Profilpfad vergleichen.'
}
$manifest = Join-Path $ExtensionsRoot 'gg.ocb.obsidian\package.json'
if (Test-Path -LiteralPath $manifest -PathType Leaf) {
 try {
  $meta = Get-Content -LiteralPath $manifest -Raw | ConvertFrom-Json
  if ($meta.identifier -ne 'gg.ocb.obsidian') { throw 'Paketkennung passt nicht.' }
  Write-Output ("Installierte Version: " + $meta.version)
  foreach ($rel in @('obsidian.css','preview.png','assets\header.webp','assets\glass-4k.webp','assets\bigcircle.webp')) {
   if (-not (Test-Path -LiteralPath (Join-Path (Split-Path $manifest) $rel) -PathType Leaf)) { throw "Installierte Datei fehlt: $rel" }
  }
  Write-Output 'Installierte Kerndateien vorhanden. Theme im Client aktivieren.'
 } catch { Write-Output ("FEHLER in der installierten Kopie: " + $_.Exception.Message); exit 1 }
} else { Write-Output 'An diesem Ziel ist kein OCB-Theme installiert.' }
if (Get-Process -Name TeamSpeak -ErrorAction SilentlyContinue) { Write-Output 'TeamSpeak 6 laeuft. Vor einer Installation vollstaendig beenden.' }
try {
 & (Join-Path $PSScriptRoot 'Verify-Package.ps1')
 Write-Output 'Das entpackte Download-Paket ist vollstaendig und unveraendert.'
} catch {
 Write-Output ("PAKETFEHLER: " + $_.Exception.Message)
 Write-Output "ZIP erneut herunterladen und per 'Alle extrahieren' in einen neuen Ordner entpacken."
 exit 1
}
