# Script para aplicar configurações no Cursor (Windows)
$CursorPath = "$env:APPDATA\Cursor\User\profiles\-590a8329"

if (-not (Test-Path $CursorPath)) {
    Write-Host "Pasta do Cursor não encontrada. Crie um profile primeiro ou ajuste o caminho." -ForegroundColor Yellow
    exit 1
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Copy-Item "$ScriptDir\cursor\settings.json" "$CursorPath\settings.json" -Force
Copy-Item "$ScriptDir\cursor\keybindings.json" "$CursorPath\keybindings.json" -Force

Write-Host "Configurações aplicadas com sucesso!" -ForegroundColor Green
Write-Host "Reinicie o Cursor para garantir que tudo funcione." -ForegroundColor Gray
