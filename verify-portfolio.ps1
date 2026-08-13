[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$indexPath = Join-Path $root 'index.html'

if (-not (Test-Path -LiteralPath $indexPath)) {
    throw "index.html is missing"
}

$html = Get-Content -LiteralPath $indexPath -Raw -Encoding UTF8
$errors = [System.Collections.Generic.List[string]]::new()

function Add-Error([string] $Message) {
    $errors.Add($Message)
}

foreach ($required in @('<title>', 'name="description"', 'property="og:title"',
        'property="og:description"', '<meta name="viewport"')) {
    if (-not $html.Contains($required)) {
        Add-Error "Missing required metadata: $required"
    }
}

$ids = [regex]::Matches($html, '\sid="([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
foreach ($duplicate in $ids | Group-Object | Where-Object Count -gt 1) {
    Add-Error "Duplicate id: $($duplicate.Name)"
}

$idSet = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
foreach ($id in $ids) { [void] $idSet.Add($id) }

$fragmentLinks = [regex]::Matches($html, 'href="#([^"]+)"')
foreach ($match in $fragmentLinks) {
    $target = $match.Groups[1].Value
    if (-not $idSet.Contains($target)) {
        Add-Error "Fragment link has no matching id: #$target"
    }
}

$assetMatches = [regex]::Matches($html, '(?:src|href)="([^"]+)"')
$localAssets = foreach ($match in $assetMatches) {
    $value = $match.Groups[1].Value
    if ($value -match '^(?:https?:|mailto:|data:|#)') { continue }
    $value
}
foreach ($asset in $localAssets | Sort-Object -Unique) {
    $resolved = Join-Path $root ($asset -replace '/', '\')
    if (-not (Test-Path -LiteralPath $resolved)) {
        Add-Error "Missing local asset: $asset"
    }
}

$blankLinks = [regex]::Matches($html, '<a\b[^>]*target="_blank"[^>]*>',
    [Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $blankLinks) {
    if ($match.Value -notmatch 'rel="[^"]*noopener[^"]*"') {
        Add-Error "New-tab link is missing rel=noopener: $($match.Value)"
    }
}

foreach ($tag in @('div', 'section')) {
    $opens = [regex]::Matches($html, "<$tag(?:\s|>)").Count
    $closes = [regex]::Matches($html, "</$tag>").Count
    if ($opens -ne $closes) {
        Add-Error "Unbalanced <$tag> tags: $opens open, $closes close"
    }
}

if ($html -match '(?i)(file://|[A-Z]:\\|\.\./\.\./Pictures/)') {
    Add-Error 'A local filesystem reference is present in index.html'
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host ("Portfolio verification passed: {0} local assets, {1} IDs, {2} fragment links." -f `
    @($localAssets | Sort-Object -Unique).Count, $ids.Count, $fragmentLinks.Count) -ForegroundColor Green

