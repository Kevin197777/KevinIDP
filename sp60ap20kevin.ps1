# Definir el umbral de memoria en MB
$umbralMemoriaMB = 200

# Convertir el umbral a bytes (1 MB = 1 * 1024 * 1024 bytes)
$umbralMemoriaBytes = $umbralMemoriaMB * 1MB

# Obtener la lista de procesos en ejecución
$procesos = Get-Process

# Recorrer cada proceso
foreach ($proceso in $procesos) {
    # Comprobar el consumo de memoria del proceso
    if ($proceso.WorkingSet -gt $umbralMemoriaBytes) {
        # Mostrar información del proceso que se va a finalizar
        Write-Host "Finalizando proceso: $($proceso.Name) (ID: $($proceso.Id)) - Consumo de memoria: $([math]::round($proceso.WorkingSet / 1MB, 2)) MB"

        # Finalizar el proceso
        Stop-Process -Force $proceso.Id
    }
}