param (
    [string]$url = "C:\Program Files\Google\Chrome\Application\chrome.exe"
)

# Ruta al ejecutable de Google Chrome
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Verificar si el ejecutable de Chrome existe
if (-Not (Test-Path $chromePath)) {
    Write-Host "Google Chrome no está instalado en la ruta especificada: $chromePath"
    exit 1
}

# Verificar si se ha pasado una URL
if (-Not $url) {
    Write-Host "Por favor, proporciona una URL como parámetro."
    exit 1
}

try {
    # Iniciar Google Chrome con la URL proporcionada
    Start-Process -FilePath $chromePath -ArgumentList $url
} catch {
    Write-Host "Error al intentar ejecutar Google Chrome: $_"
}