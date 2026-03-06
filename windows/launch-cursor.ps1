# Abre Cursor em janela de tamanho medio (1200x800) centralizada
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

$exe = "$env:LOCALAPPDATA\Programs\cursor\Cursor.exe"
if (-not (Test-Path $exe)) { Write-Host "Cursor nao encontrado." -ForegroundColor Yellow; exit 1 }

$proc = Start-Process -FilePath $exe -PassThru
$width = 1200
$height = 800
$screenW = [Win32]::GetSystemMetrics(0)
$screenH = [Win32]::GetSystemMetrics(1)
$x = [Math]::Max(0, ($screenW - $width) / 2)
$y = [Math]::Max(0, ($screenH - $height) / 2)

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
