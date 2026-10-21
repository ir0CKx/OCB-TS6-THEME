$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath($PSScriptRoot).TrimEnd('\')
$count = 0
foreach ($line in Get-Content -LiteralPath (Join-Path $root 'SHA256SUMS.txt')) {
 if (-not $line.Trim()) { continue }
 if ($line -notmatch '^([a-fA-F0-9]{64})  (.+)$') { throw 'Invalid checksum entry.' }
 $expected = $Matches[1]
 $relative = $Matches[2].Replace('/', '\')
 $file = [IO.Path]::GetFullPath((Join-Path $root $relative))
 if (-not $file.StartsWith($root + '\', [StringComparison]::OrdinalIgnoreCase)) { throw 'Invalid path.' }
 if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Missing file: $relative" }
 if ((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash -ne $expected) { throw "Checksum mismatch: $relative" }
 $count++
}
if ($count -eq 0) { throw 'Empty checksum list.' }
Write-Output "OK: $count files verified."
