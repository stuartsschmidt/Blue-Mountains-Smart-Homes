# Start a simple static server for local testing.
# Usage: Right-click -> Run with PowerShell or run: .\start-local.ps1
param(
    [int]$Port = 8000
)

# Prefer Python3 if available
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "Starting Python http.server on port $Port serving current directory..."
    python -m http.server $Port
} elseif (Get-Command python3 -ErrorAction SilentlyContinue) {
    Write-Host "Starting Python3 http.server on port $Port serving current directory..."
    python3 -m http.server $Port
} else {
    Write-Host "Python not found. You can install Python or use another static server."
    Write-Host "Alternatively, run: "
    Write-Host "  npx http-server -p $Port"
}
