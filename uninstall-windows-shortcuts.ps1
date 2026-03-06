# Remove atalhos e launchers criados pelo install-windows-shortcuts.ps1

$ShortcutsDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Atalhos"
$LaunchersDir = "$env:LOCALAPPDATA\Config\launchers"

if (Test-Path $ShortcutsDir) {
    Remove-Item "$ShortcutsDir\*" -Force
    if ((Get-ChildItem $ShortcutsDir -ErrorAction SilentlyContinue).Count -eq 0) {
        Remove-Item $ShortcutsDir -Force
    }
    Write-Host "Atalhos removidos." -ForegroundColor Green
} else {
    Write-Host "Pasta de atalhos nao encontrada." -ForegroundColor Gray
}

if (Test-Path $LaunchersDir) {
    Remove-Item $LaunchersDir -Recurse -Force
    Write-Host "Launchers removidos." -ForegroundColor Green
} else {
    Write-Host "Pasta de launchers nao encontrada." -ForegroundColor Gray
}

Write-Host "`nAtalhos desativados." -ForegroundColor Cyan
