$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath($PSScriptRoot).TrimEnd('\')
$count = 0
$listed = @{}
foreach ($line in Get-Content -LiteralPath (Join-Path $root 'SHA256SUMS.txt')) {
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
$themeRoot = Join-Path $root 'gg.ocb.obsidian'
foreach ($item in Get-ChildItem -LiteralPath $themeRoot -Recurse -Force) {
 if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw 'Linked theme files or directories are not supported.' }
 if (-not $item.PSIsContainer -and -not $listed.ContainsKey($item.FullName)) {
  throw "Unexpected theme file. Extract the ZIP into an empty folder: $($item.Name)"
 }
}
Write-Output "OK: $count files verified."
