$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath($PSScriptRoot).TrimEnd('\')
if ((Split-Path $root -Leaf) -eq 'Daten') { $root = Split-Path $root -Parent }
$count = 0
$listed = @{}
foreach ($line in Get-Content -LiteralPath (Join-Path $PSScriptRoot 'SHA256SUMS.txt')) {
 if (-not $line.Trim()) { continue }
 if ($line -notmatch '^([a-fA-F0-9]{64})  (.+)$') { throw 'Invalid checksum entry.' }
 $expected = $Matches[1]
 $relative = $Matches[2].Replace('/', '\')
 $file = [IO.Path]::GetFullPath((Join-Path $root $relative))
 if (-not $file.StartsWith($root + '\', [StringComparison]::OrdinalIgnoreCase)) { throw 'Invalid path.' }
 if ($listed.ContainsKey($file)) { throw "Duplicate checksum entry: $relative" }
 $listed[$file] = $true
 if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Missing file: $relative" }
 if ((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash -ne $expected) { throw "Checksum mismatch: $relative" }
 $count++
}
if ($count -eq 0) { throw 'Empty checksum list.' }
$themeRoot = Join-Path $PSScriptRoot 'gg.ocb.obsidian'
foreach ($item in Get-ChildItem -LiteralPath $themeRoot -Recurse -Force) {
 if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw 'Linked theme files or directories are not supported.' }
 if (-not $item.PSIsContainer -and -not $listed.ContainsKey($item.FullName)) {
  throw "Unexpected theme file. Extract the ZIP into an empty folder: $($item.Name)"
 }
}
$meta = Get-Content -LiteralPath (Join-Path $themeRoot 'package.json') -Raw | ConvertFrom-Json
if ($meta.identifier -ne 'gg.ocb.obsidian') { throw 'Invalid theme identifier.' }
if ($meta.name.Length -lt 5 -or $meta.name.Length -gt 64) { throw 'Package name must contain 5 to 64 characters.' }
if (@($meta.content.themes).Count -lt 1) { throw 'No theme variants found.' }
foreach ($variant in $meta.content.themes) {
 if ($variant.name.Length -lt 4 -or $variant.name.Length -gt 30) { throw 'TeamSpeak theme variant names must contain 4 to 30 characters. Package not installed.' }
 foreach ($relative in @($variant.source, $variant.image, $meta.image)) {
  $asset = [IO.Path]::GetFullPath((Join-Path $themeRoot $relative))
  if (-not $asset.StartsWith($themeRoot + '\', [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $asset -PathType Leaf)) { throw 'Invalid or missing manifest asset.' }
 }
}
Write-Output "OK: $count files verified; manifest names and assets checked."
