# Define the registry paths
$registryPathWindowsUpdate = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$registryPathCacheSet001 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\GPCache\CacheSet001\WindowsUpdate"
$registryPathCacheSet002 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\GPCache\CacheSet002\WindowsUpdate"

# Function to remove registry keys if they exist
function Remove-RegistryPath($path) {
    if (Test-Path $path) {
        Remove-Item -Path $path -Recurse -Force
        Write-Output "Contents of $path have been deleted successfully."
    } else {
        Write-Output "$path does not exist."
    }
}

# Remove all subkeys and contents at the specified paths
Remove-RegistryPath $registryPathWindowsUpdate
Remove-RegistryPath $registryPathCacheSet001
Remove-RegistryPath $registryPathCacheSet002

# Restart the Windows Update service
Restart-Service -Name "wuauserv" -Force
