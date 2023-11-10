function Write-MatrixEffect {
    param (
        [string]$Characters,
        [int]$Delay
    )
    
    $consoleWidth = $Host.UI.RawUI.BufferSize.Width
    
    while ($true) {
        $row = ""
        $rowCount = Get-Random -Minimum 5 -Maximum 15
        
        1..$rowCount | ForEach-Object {
            $row += $Characters[(Get-Random -Minimum 0 -Maximum $Characters.Length)]
        }
        
        $row += " " * ($consoleWidth - $rowCount)
        
        Write-Host $row -NoNewline
        Start-Sleep -Milliseconds $Delay
    }
}

Write-MatrixEffect -Characters "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>/?`~" -Delay 50
