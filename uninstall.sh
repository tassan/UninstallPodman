# Verify if WSL is installed and list all distributions
Write-Host "Listing all WSL distributions..."
wsl --list --verbose

# Unregister Podman machine from WSL
Write-Host "Unregistering Podman machine from WSL..."
wsl --unregister podman-machine-default

# Confirm the unregistration
Write-Host "Verifying Podman machine unregistration..."
$wslList = wsl --list --verbose
if ($wslList -notmatch "podman-machine-default") {
    Write-Host "Podman machine unregistered successfully."
} else {
    Write-Host "Failed to unregister Podman machine. Exiting script."
    exit 1
}

# Define paths to delete
$pathsToDelete = @(
    "$HOME\.local\share\containers\podman\machine\wsl",
    "$HOME\.config\containers\podman\machine",
    "$HOME\AppData\Roaming\containers",
    "$HOME\.ssh\podman-machine-default.pub"
)

# Delete folders and file
foreach ($path in $pathsToDelete) {
    if (Test-Path -Path $path) {
        if ((Get-Item $path).PSIsContainer) {
            Write-Host "Deleting folder: $path"
            Remove-Item -Path $path -Recurse -Force
        } else {
            Write-Host "Deleting file: $path"
            Remove-Item -Path $path -Force
        }
    } else {
        Write-Host "Path not found, skipping: $path"
    }
}

Write-Host "Cleanup completed. You can now reinitialize Podman using 'podman machine init'."
