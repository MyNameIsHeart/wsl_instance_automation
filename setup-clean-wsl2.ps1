param(
    [switch]$Reset,
    [switch]$Delete
)

$DistName = "CleanUbuntu"
$InstallPath = "C:\wsl\$DistName"
$DistUrl = "https://cloud-images.ubuntu.com/minimal/releases/noble/release/ubuntu-24.04-minimal-cloudimg-amd64-root.tar.xz" # not automatically set to latest...
$TarFile = [IO.Path]::GetFileName($DistUrl)
$DistFile = "$env:TEMP\$TarFile" # keep the tar in %TEMP% - only needed once during import

function Is-Instance-Valid {
    param($Name)
    try {
      wsl -d $Name -- echo ok | Out-Null
      $true
    }
    catch {
      $false
    }
}

function Remove-Files {
    if ((wsl -l -q) -contains $DistName) {
        Write-Host "`nunregistering $DistName`n"
        wsl --unregister $DistName
    }
    if (Test-Path $InstallPath) {
      Remove-Item -Recurse -Force $InstallPath
    }
    if (Test-Path $DistFile) {
      Remove-Item -Force $DistFile
    }
}

# reset if the registration exists but is broken
if ((wsl -l -q) -contains $DistName -and -not (Is-Instance-Valid $DistName)) {
    Write-Warning "$DistName is registered but unusable - forcing reset"
    $Reset = $true
}

if ($Reset) {
    Remove-Files
}

if ($Delete) {
    Remove-Files
    Write-Host "`n$DistName removed, Exiting`n"
    return
}

# download if needed
if (-not (Test-Path $DistFile)) {
    Write-Host "`ndownloading $DistFile`n"
    Invoke-WebRequest $DistUrl -OutFile $DistFile
}

# import if needed
if (-not ((wsl -l -q) -contains $DistName)) {
    Write-Host "`nimporting $DistName as WSL-2 `n"
    wsl --import $DistName $InstallPath $DistFile --version 2
}

Write-Host "`nfinished creating instance $DistName`n"
