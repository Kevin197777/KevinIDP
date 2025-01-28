#!/bin/bash

# Solicitar datos para la creación del usuario
read -p "Ingrese el nombre del nuevo usuario: " username
read -p "Ingrese la contraseña para el nuevo usuario: " password
read -p "Ingrese el nombre completo del nuevo usuario: " fullname
read -p "Ingrese el grupo del nuevo usuario (dejar vacío para el grupo predeterminado): " group

# Crear el nuevo usuario
if [ -z "$group" ]; then
    sudo useradd -m -c "$fullname" "$username"
else
    sudo useradd -m -c "$fullname" -g "$group" "$username"
fi

# Establecer la contraseña para el nuevo usuario
echo "$username:$password" | sudo chpasswd

# Mostrar los nombres de los usuarios con UID superior a 999
echo "Usuarios del sistema con UID superior a 999:"
awk -F: '$3 > 999 {print $1}' /etc/passwd
