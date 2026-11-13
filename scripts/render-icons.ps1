# Renders documentation icons from the icon fonts that ProCap uses.
#
# ProCap writes icons as text, for example <icon=content_save> or <icon=procap_domain>.
# Names starting with procap_ come from the ProCapIcons font in the code base. All other names
# come from the Material Design Icons font of the PurrUI package, which this script downloads
# from the public PurrUI repository on first use.
#
# Example:
#   .\scripts\render-icons.ps1 -Icons "icon-save.png:content_save;icon-domain.png:procap_domain"
#
# Each icon is a 55x55 px PNG: a #363636 rounded square with the white glyph centered.
# Add ":RRGGBB" to an entry to use another background, for example "icon-close-project.png:close:E5484D".
param(
    [Parameter(Mandatory = $true)][string]$Icons,
    [string]$OutDir = (Join-Path $PSScriptRoot "..\docs\.gitbook\assets"),
    [string]$CodeBase = "C:\Users\AndrinLandolt\core_engine\core_engine",
    [string]$CacheDir = (Join-Path $env:TEMP "procap-docs-icon-fonts"),
    [int]$Size = 55,
    [double]$Em = 31,
    [double]$Radius = 12
)
$ErrorActionPreference = "Stop"
Add-Type -AssemblyName PresentationCore, WindowsBase
Add-Type -Namespace DocsIcons -Name Native -MemberDefinition @'
[DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
public static extern uint GetLongPathName(string shortPath, System.Text.StringBuilder longPath, uint size);
'@

function Get-LongPath([string]$Path) {
    $full = (Resolve-Path $Path).Path
    $sb = New-Object System.Text.StringBuilder 1024
    if ([DocsIcons.Native]::GetLongPathName($full, $sb, 1024) -gt 0) { return $sb.ToString() }
    return $full
}

New-Item -ItemType Directory -Force $CacheDir | Out-Null
$purr = "https://raw.githubusercontent.com/PurrNet/PurrUI/dev/Assets/PurrUI/Runtime/MaterialIcon"
[Net.ServicePointManager]::SecurityProtocol = "Tls12"
foreach ($pair in @(@("mdi.ttf", "Icons/materialdesignicons-webfont.ttf"), @("MaterialIcons.cs", "MaterialIcons.cs"))) {
    $target = Join-Path $CacheDir $pair[0]
    if (-not (Test-Path $target)) {
        Invoke-WebRequest "$purr/$($pair[1])" -OutFile $target -Headers @{ "User-Agent" = "docs-client" }
    }
}

$fonts = @{
    mdi    = @{ ttf = Join-Path $CacheDir "mdi.ttf"; map = Join-Path $CacheDir "MaterialIcons.cs" }
    procap = @{ ttf = Join-Path $CodeBase "Assets\Resources\Fonts\ProCapIcons\ProCapIcons.ttf"; map = Join-Path $CodeBase "Assets\Scripts\UI\ProCapUi\ProCapIcons.cs" }
}
$typefaces = @{}
$maps = @{}
foreach ($k in $fonts.Keys) {
    # WPF cannot load a font from a short 8.3 path (for example C:\Users\ABCDEF~1\...), so pass the long path.
    $typefaces[$k] = New-Object System.Windows.Media.GlyphTypeface (New-Object System.Uri (Get-LongPath $fonts[$k].ttf))
    $m = @{}
    foreach ($x in [regex]::Matches([IO.File]::ReadAllText($fonts[$k].map), '\{\s*"([a-z0-9_]+)",\s*"\\U([0-9A-Fa-f]{8})"\s*\}')) {
        $m[$x.Groups[1].Value] = [Convert]::ToInt32($x.Groups[2].Value, 16)
    }
    $maps[$k] = $m
}

foreach ($spec in ($Icons -split ";" | Where-Object { $_ })) {
    $p = $spec -split ":"
    $file = $p[0]; $glyph = $p[1]
    $bgHex = if ($p.Count -gt 2) { $p[2] } else { "363636" }
    $font = if ($glyph.StartsWith("procap_")) { "procap" } else { "mdi" }
    $cp = $maps[$font][$glyph]
    if ($null -eq $cp) { Write-Warning "Unknown icon name: $glyph"; continue }

    $tf = $typefaces[$font]
    $geo = $tf.GetGlyphOutline($tf.CharacterToGlyphMap[$cp], $Em, $Em)
    $b = $geo.Bounds
    $geo.Transform = New-Object System.Windows.Media.TranslateTransform (($Size - $b.Width) / 2 - $b.X), (($Size - $b.Height) / 2 - $b.Y)

    $dv = New-Object System.Windows.Media.DrawingVisual
    $dc = $dv.RenderOpen()
    $bg = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#FF$bgHex"))
    $dc.DrawRoundedRectangle($bg, $null, (New-Object System.Windows.Rect 0, 0, $Size, $Size), $Radius, $Radius)
    $dc.DrawGeometry([System.Windows.Media.Brushes]::White, $null, $geo)
    $dc.Close()

    $rtb = New-Object System.Windows.Media.Imaging.RenderTargetBitmap $Size, $Size, 96, 96, ([System.Windows.Media.PixelFormats]::Pbgra32)
    $rtb.Render($dv)
    $enc = New-Object System.Windows.Media.Imaging.PngBitmapEncoder
    $enc.Frames.Add([System.Windows.Media.Imaging.BitmapFrame]::Create($rtb))
    $fs = [IO.File]::Create((Join-Path $OutDir $file))
    try { $enc.Save($fs) } finally { $fs.Close() }
    Write-Output "$file <- $glyph"
}
