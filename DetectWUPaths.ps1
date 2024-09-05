$paths = @(
    "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\GPCache\CacheSet001\WindowsUpdate",
    "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\GPCache\CacheSet002\WindowsUpdate",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
)

$anyPathExists = $false

foreach ($path in $paths) {
    if (Test-Path $path) {
        $anyPathExists = $true
        break
    }
}

if ($anyPathExists) {
    Write-Host "Registry keys do exist"
    EXIT 1
} else {
    Write-Host "Registry keys do not Exist"
    EXIT 0
}
