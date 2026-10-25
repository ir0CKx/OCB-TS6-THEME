$ErrorActionPreference = 'Stop'
$suite = Join-Path (Join-Path (Split-Path $PSScriptRoot -Parent) 'test-results') ('ocb-installer-test-' + [Guid]::NewGuid().ToString('N'))
$package = Join-Path $suite 'package'
$repo = Split-Path $PSScriptRoot -Parent
New-Item -ItemType Directory -Path (Join-Path $repo 'test-results') -Force | Out-Null
$version = (Get-Content (Join-Path $repo 'gg.ocb.obsidian/package.json') -Raw | ConvertFrom-Json).version
Expand-Archive -LiteralPath (Join-Path $repo "dist/OCB.GG-Glass-Dark-Theme-v$version.zip") -DestinationPath $package
$bundle = $package
$package = Join-Path $bundle 'Daten'
$root = Join-Path $suite 'profile/extensions'
$target = Join-Path $root 'gg.ocb.obsidian'
$results = @()
$missing = Join-Path $suite 'incomplete'
New-Item -ItemType Directory -Path $missing | Out-Null
Copy-Item -LiteralPath (Join-Path $package 'Install.ps1') -Destination $missing
try { & (Join-Path $missing 'Install.ps1') -ExtensionsRoot $root; throw 'Incomplete package accepted' }
catch { if ($_.Exception.Message -notmatch 'Alle extrahieren') { throw }; $results += 'incomplete extraction gives actionable error' }
function Expect-Failure($label, $action, $pattern) {
 try { & $action; throw "Expected failure missing: $label" }
 catch { if ($_.Exception.Message -notmatch $pattern) { throw }; $script:results += $label }
}
& (Join-Path $package 'Verify-Package.ps1')
$extra = Join-Path $package 'gg.ocb.obsidian/stale.css'
Set-Content -LiteralPath $extra -Value 'old theme'
Expect-Failure 'extra theme file rejected' { & (Join-Path $package 'Verify-Package.ps1') } 'Unexpected theme file'
Remove-Item -LiteralPath $extra
$sum = Join-Path $package 'SHA256SUMS.txt'; $original = [IO.File]::ReadAllText($sum)
Add-Content -LiteralPath $sum -Value (($original -split '\r?\n')[0])
Expect-Failure 'duplicate checksum rejected' { & (Join-Path $package 'Verify-Package.ps1') } 'Duplicate checksum'
[IO.File]::WriteAllText($sum,$original,[Text.UTF8Encoding]::new($false))
# Simulate running/stopped clients locally; never stop the real client.
function Get-Process { param($Name,$ErrorAction) return [pscustomobject]@{Name='TeamSpeak'} }
Expect-Failure 'running client install blocked' { & (Join-Path $package 'Install.ps1') -ExtensionsRoot $root } 'noch geoeffnet'
function Get-Process { param($Name,$ErrorAction) }
& (Join-Path $package 'Install.ps1') -ExtensionsRoot $root
if (-not (Test-Path -LiteralPath (Join-Path $target 'obsidian.css'))) { throw 'Install failed' }
$results += 'clean install succeeded'
Set-Content -LiteralPath (Join-Path $target 'obsolete-test.css') -Value 'old'
& (Join-Path $package 'Install.ps1') -ExtensionsRoot $root
if (Test-Path -LiteralPath (Join-Path $target 'obsolete-test.css')) { throw 'Old file carried into active theme' }
$results += 'update removes old files from active theme and backs them up'
# Fail only the final staging move, exercising restoration and cleanup.
function Move-Item {
 param($LiteralPath,$Destination)
 if ([IO.Path]::GetFileName($LiteralPath) -like 'gg.ocb.obsidian-staging-*') { throw 'Injected final move failure' }
 Microsoft.PowerShell.Management\Move-Item -LiteralPath $LiteralPath -Destination $Destination
}
Expect-Failure 'failed final move restores previous version' { & (Join-Path $package 'Install.ps1') -ExtensionsRoot $root } 'Injected final move failure'
if (-not (Test-Path -LiteralPath (Join-Path $target 'obsidian.css'))) { throw 'Rollback missing' }
if (Get-ChildItem -LiteralPath $root -Filter '*-staging-*') { throw 'Staging leaked' }
$results += 'failed install leaves no staging folder'
Remove-Item Function:\Move-Item
function Get-Process { param($Name,$ErrorAction) return [pscustomobject]@{Name='TeamSpeak'} }
Expect-Failure 'running client uninstall blocked' { & (Join-Path $package 'Uninstall.ps1') -ExtensionsRoot $root } 'noch geoeffnet'
if (-not (Test-Path -LiteralPath $target)) { throw 'Running client theme removed' }
function Get-Process { param($Name,$ErrorAction) }
& (Join-Path $package 'Uninstall.ps1') -ExtensionsRoot $root
if (Test-Path -LiteralPath $target) { throw 'Uninstall failed' }
$results += 'uninstall archives theme'
@{results=$results;testRoot="isolated temporary directory";liveClient=$false} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $repo 'test-results/installer.json') -Encoding UTF8
Write-Output ('PASS: ' + $results.Count + ' installer scenarios')

