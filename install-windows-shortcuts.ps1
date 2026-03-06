# Aplica atalhos do Windows (Cursor, Chrome, Terminal, Warp, VS Code, Explorer)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
& "$ScriptDir\windows\create-shortcuts.ps1"
