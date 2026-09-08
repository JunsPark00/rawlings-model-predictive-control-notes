param(
    [string]$Pptx = (Join-Path $PSScriptRoot "../chapter01_getting_started/slides/chapter01_slides.pptx")
)

# Windows + Microsoft PowerPoint. Export the editable PPTX as its sibling PDF.
$ErrorActionPreference = "Stop"
$source = (Resolve-Path $Pptx).Path
$target = [System.IO.Path]::ChangeExtension($source, ".pdf")
$app = $null
$deck = $null
try {
    $app = New-Object -ComObject PowerPoint.Application
    $deck = $app.Presentations.Open($source, $true, $false, $false)
    $deck.SaveAs($target, 32) # ppSaveAsPDF
    Write-Output "Exported: $target ($($deck.Slides.Count) slides)"
} finally {
    if ($null -ne $deck) {
        $deck.Close()
        [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($deck)
    }
    # Do not quit PowerPoint: an existing user presentation may be open.
    if ($null -ne $app) {
        [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($app)
    }
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}
