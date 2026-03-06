# Abre Warp em janela pequena (700x450) centralizada
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

$exe = "$env:LOCALAPPDATA\Programs\Warp\Warp.exe"
if (-not (Test-Path $exe)) {
    Write-Host "Warp nao encontrado." -ForegroundColor Yellow
    exit 1
}

Start-Process -FilePath $exe
$width = 700
$height = 450
$screenW = [Win32]::GetSystemMetrics(0)
$screenH = [Win32]::GetSystemMetrics(1)
$x = [Math]::Max(0, ($screenW - $width) / 2)
$y = [Math]::Max(0, ($screenH - $height) / 2)

for ($i = 0; $i -lt 30; $i++) {
    Start-Sleep -Milliseconds 200
    $proc = Get-Process -Name "Warp" -ErrorAction SilentlyContinue | Sort-Object StartTime -Descending | Select-Object -First 1
    if ($proc -and $proc.MainWindowHandle -ne [IntPtr]::Zero) {
        [Win32]::MoveWindow($proc.MainWindowHandle, $x, $y, $width, $height, $true) | Out-Null
        break
    }
}
