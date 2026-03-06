# Abre VS Code em janela 1270x300 centralizada (mesmo tamanho do Cursor)
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int nIndex);
}
"@

$exe = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe"
if (-not (Test-Path $exe)) { $exe = "$env:ProgramFiles\Microsoft VS Code\Code.exe" }
if (-not (Test-Path $exe)) { Write-Host "VS Code nao encontrado." -ForegroundColor Yellow; exit 1 }

$proc = Start-Process -FilePath $exe -ArgumentList "-n" -PassThru
$width = 1270
$height = 300
$screenW = [Win32]::GetSystemMetrics(0)
$screenH = [Win32]::GetSystemMetrics(1)
$x = [Math]::Max(0, ($screenW - $width) / 2)
$y = [Math]::Max(0, ($screenH - $height) / 2)

# VS Code usa processo Code.exe ou electron
for ($i = 0; $i -lt 30; $i++) {
    Start-Sleep -Milliseconds 200
    try {
        $proc.Refresh()
        if ($proc.MainWindowHandle -ne [IntPtr]::Zero) {
            [Win32]::MoveWindow($proc.MainWindowHandle, $x, $y, $width, $height, $true) | Out-Null
            break
        }
    } catch { }
}
