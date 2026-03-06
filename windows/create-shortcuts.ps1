# Cria atalhos do Windows com teclas de atalho (Ctrl+Alt+Tecla)
# Copia launchers para %LOCALAPPDATA%\Config\launchers\

$ShortcutsDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Atalhos"
$LaunchersDir = "$env:LOCALAPPDATA\Config\launchers"
$ScriptDir = $PSScriptRoot

if (-not (Test-Path $ShortcutsDir)) {
    New-Item -ItemType Directory -Path $ShortcutsDir -Force | Out-Null
}
if (-not (Test-Path $LaunchersDir)) {
    New-Item -ItemType Directory -Path $LaunchersDir -Force | Out-Null
}

# Copia scripts de launcher
Copy-Item "$ScriptDir\launch-cursor.ps1" "$LaunchersDir\" -Force -ErrorAction SilentlyContinue
Copy-Item "$ScriptDir\launch-terminal.ps1" "$LaunchersDir\" -Force -ErrorAction SilentlyContinue
Copy-Item "$ScriptDir\launch-warp.ps1" "$LaunchersDir\" -Force -ErrorAction SilentlyContinue

$WshShell = New-Object -ComObject WScript.Shell

function New-Shortcut {
    param($Path, $TargetPath, $Arguments = "", $Hotkey = "", $WindowStyle = 1)
    $shortcut = $WshShell.CreateShortcut($Path)
    $shortcut.TargetPath = $TargetPath
    if ($Arguments) { $shortcut.Arguments = $Arguments }
    if ($Hotkey) { $shortcut.Hotkey = $Hotkey }
    $shortcut.WindowStyle = $WindowStyle
    $shortcut.Save()
    Write-Host "  Criado: $(Split-Path $Path -Leaf)" -ForegroundColor Green
}

# --- 1. Cursor (Ctrl+Alt+C) - janela media 1200x800 ---
if (Test-Path "$env:LOCALAPPDATA\Programs\cursor\Cursor.exe") {
    New-Shortcut -Path "$ShortcutsDir\Cursor.lnk" `
        -TargetPath "powershell.exe" `
        -Arguments "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$LaunchersDir\launch-cursor.ps1`"" `
        -Hotkey "CTRL+ALT+C"
} else {
    Write-Host "  Cursor nao encontrado." -ForegroundColor Yellow
}

# --- 2. Chrome - Nova janela (Ctrl+Alt+B) ---
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
if (-not (Test-Path $chromePath)) { $chromePath = "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe" }
if (Test-Path $chromePath) {
    New-Shortcut -Path "$ShortcutsDir\Chrome - Nova Janela.lnk" `
        -TargetPath $chromePath `
        -Arguments "--new-window" `
        -Hotkey "CTRL+ALT+B"
} else {
    Write-Host "  Chrome nao encontrado." -ForegroundColor Yellow
}

# --- 3. Chrome - Janela anonima (Ctrl+Alt+I) ---
if (Test-Path $chromePath) {
    New-Shortcut -Path "$ShortcutsDir\Chrome - Anonimo.lnk" `
        -TargetPath $chromePath `
        -Arguments "--incognito" `
        -Hotkey "CTRL+ALT+I"
}

# --- 4. Windows Terminal (Ctrl+Alt+T) - janela pequena 700x450 ---
if (Test-Path "$env:LOCALAPPDATA\Microsoft\WindowsApps\wt.exe") {
    New-Shortcut -Path "$ShortcutsDir\Windows Terminal.lnk" `
        -TargetPath "powershell.exe" `
        -Arguments "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$LaunchersDir\launch-terminal.ps1`"" `
        -Hotkey "CTRL+ALT+T"
} else {
    New-Shortcut -Path "$ShortcutsDir\Terminal.lnk" `
        -TargetPath "powershell.exe" `
        -Hotkey "CTRL+ALT+T"
    Write-Host "  Windows Terminal nao encontrado, usando PowerShell." -ForegroundColor Gray
}

# --- 5. Warp (Ctrl+Alt+W) - janela pequena 700x450 ---
if (Test-Path "$env:LOCALAPPDATA\Programs\Warp\Warp.exe") {
    New-Shortcut -Path "$ShortcutsDir\Warp.lnk" `
        -TargetPath "powershell.exe" `
        -Arguments "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$LaunchersDir\launch-warp.ps1`"" `
        -Hotkey "CTRL+ALT+W"
} else {
    Write-Host "  Warp nao encontrado." -ForegroundColor Yellow
}

# --- 6. VS Code (Ctrl+Alt+V) ---
$vscodePath = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe"
if (-not (Test-Path $vscodePath)) { $vscodePath = "$env:ProgramFiles\Microsoft VS Code\Code.exe" }
if (Test-Path $vscodePath) {
    New-Shortcut -Path "$ShortcutsDir\VS Code.lnk" -TargetPath $vscodePath -Hotkey "CTRL+ALT+V"
} else {
    Write-Host "  VS Code nao encontrado." -ForegroundColor Yellow
}

# --- 7. File Explorer (Ctrl+Alt+E) ---
New-Shortcut -Path "$ShortcutsDir\Explorador de Arquivos.lnk" `
    -TargetPath "explorer.exe" `
    -Hotkey "CTRL+ALT+E"

Write-Host "`nAtalhos criados em: $ShortcutsDir" -ForegroundColor Cyan
Write-Host "`nTeclas (Ctrl+Alt + tecla):" -ForegroundColor Cyan
Write-Host "  C - Cursor (janela media)"
Write-Host "  B - Chrome nova janela"
Write-Host "  I - Chrome anonimo"
Write-Host "  T - Windows Terminal (janela pequena)"
Write-Host "  W - Warp (janela pequena)"
Write-Host "  V - VS Code"
Write-Host "  E - Explorador de Arquivos"
