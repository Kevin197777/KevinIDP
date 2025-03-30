# Obtener todos los servicios del sistema
$servicios = Get-Service

# Contar el total de servicios
$totalServicios = $servicios.Count

# Contar los servicios en estado "Running"
$serviciosRunning = $servicios | Where-Object { $_.Status -eq 'Running' }
$totalRunning = $serviciosRunning.Count

# Contar los servicios en estado "Stopped"
$serviciosStopped = $servicios | Where-Object { $_.Status -eq 'Stopped' }
$totalStopped = $serviciosStopped.Count

# Mostrar los resultados en la consola
Write-Host "Total de servicios: $totalServicios"
Write-Host "Servicios en estado 'Running': $totalRunning"
Write-Host "Servicios en estado 'Stopped': $totalStopped"