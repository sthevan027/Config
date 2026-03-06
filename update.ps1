# Atualiza/applica todas as configurações do repo
# Execute na pasta Config

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "=== Atualizando configuracoes ===" -ForegroundColor Cyan

Write-Host "`n[Cursor]" -ForegroundColor Yellow
& "$ScriptDir\install.ps1"

Write-Host "`n[Atalhos Windows]" -ForegroundColor Yellow
& "$ScriptDir\install-windows-shortcuts.ps1"

Write-Host "`n=== Concluido ===" -ForegroundColor Green
