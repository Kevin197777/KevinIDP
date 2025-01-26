# Solicitar al usuario el número del disco
$diskNumber = Read-Host "Introduce el número del disco que deseas utilizar"

# Obtener información del disco
$disk = Get-Disk -Number $diskNumber

if ($null -eq $disk) {
    Write-Host "El disco número $diskNumber no existe." -ForegroundColor Red
    exit
}

# Mostrar el tamaño del disco en GB
$diskSizeGB = [math]::round($disk.Size / 1GB, 2)
Write-Host "El tamaño del disco $diskNumber es de $diskSizeGB GB."

# Confirmar la limpieza del disco
$confirmation = Read-Host "¿Estás seguro de que deseas limpiar el disco $diskNumber? (S/N)"
if ($confirmation -ne 'S' -and $confirmation -ne 's') {
    Write-Host "Operación cancelada." -ForegroundColor Yellow
    exit
}

# Limpiar el disco
Clear-Disk -Number $diskNumber -RemoveData -Confirm:$false

# Crear particiones de 1 GB
$remainingSize = $disk.Size
$partitionSize = 1GB

while ($remainingSize -ge $partitionSize) {
    New-Partition -DiskNumber $diskNumber -Size $partitionSize -AssignDriveLetter
    $remainingSize -= $partitionSize
}

# Si queda espacio, crear una última partición con el tamaño restante
if ($remainingSize -gt 0) {
    New-Partition -DiskNumber $diskNumber -Size $remainingSize -AssignDriveLetter
}

Write-Host "Particiones creadas exitosamente en el disco $diskNumber." -ForegroundColor Green