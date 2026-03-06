# Cria atalhos do Windows com teclas de atalho (Ctrl+Alt+Tecla)
# Execute como Administrador NÃO é necessário

$ShortcutsDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Atalhos"
if (-not (Test-Path $ShortcutsDir)) {
    New-Item -ItemType Directory -Path $ShortcutsDir -Force | Out-Null
}

$WshShell = New-Object -ComObject WScript.Shell

function New-Shortcut {
    param($Path, $TargetPath, $Arguments = "", $Hotkey = "")
    $shortcut = $WshShell.CreateShortcut($Path)
    $shortcut.TargetPath = $TargetPath
    if ($Arguments) { $shortcut.Arguments = $Arguments }
    if ($Hotkey) { $shortcut.Hotkey = $Hotkey }
    $shortcut.Save()
    Write-Host "  Criado: $(Split-Path $Path -Leaf)" -ForegroundColor Green
}

# --- 1. Cursor (Ctrl+Alt+C) ---
$cursorPath = "$env:LOCALAPPDATA\Programs\cursor\Cursor.exe"
if (Test-Path $cursorPath) {
    New-Shortcut -Path "$ShortcutsDir\Cursor.lnk" -TargetPath $cursorPath -Hotkey "CTRL+ALT+C"
} else {
    Write-Host "  Cursor nao encontrado em: $cursorPath" -ForegroundColor Yellow
}

# --- 2. Nova janela do navegador (Ctrl+Alt+B) ---
$browserPaths = @(
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
    "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe"
)
$browserFound = $false
foreach ($bp in $browserPaths) {
    if (Test-Path $bp) {
        New-Shortcut -Path "$ShortcutsDir\Navegador - Nova Janela.lnk" `
            -TargetPath $bp `
            -Arguments "--new-window" `
            -Hotkey "CTRL+ALT+B"
        $browserFound = $true
        break
    }
}
if (-not $browserFound) {
    Write-Host "  Chrome/Edge nao encontrado. Ajuste o caminho no script." -ForegroundColor Yellow
}

# --- 3. Terminal / Warp (Ctrl+Alt+T) ---
$warpPath = "$env:LOCALAPPDATA\Programs\Warp\Warp.exe"
$wtPath = "$env:LOCALAPPDATA\Microsoft\WindowsApps\wt.exe"
if (Test-Path $warpPath) {
    New-Shortcut -Path "$ShortcutsDir\Warp.lnk" -TargetPath $warpPath -Hotkey "CTRL+ALT+T"
} elseif (Test-Path $wtPath) {
    New-Shortcut -Path "$ShortcutsDir\Windows Terminal.lnk" -TargetPath $wtPath -Hotkey "CTRL+ALT+T"
} else {
    # Fallback: PowerShell
    New-Shortcut -Path "$ShortcutsDir\Terminal.lnk" `
        -TargetPath "powershell.exe" `
        -Hotkey "CTRL+ALT+T"
    Write-Host "  Warp/WT nao encontrado. Usando PowerShell." -ForegroundColor Gray
}

Write-Host "`nAtalhos criados em: $ShortcutsDir" -ForegroundColor Cyan
Write-Host "`nTeclas de atalho (Ctrl+Alt + tecla):" -ForegroundColor Cyan
Write-Host "  C - Cursor"
Write-Host "  B - Nova janela do navegador"
Write-Host "  T - Terminal"
Write-Host "  D - Warp Terminal"
