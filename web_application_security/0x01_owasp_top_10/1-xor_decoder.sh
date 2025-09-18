#!/bin/bash

# Récupère le premier argument passé au script
password="$1"

# Vérifie si un argument est passé
if [ -z "$password" ]; then
    echo "Usage: $0 {xor}ENCODED_STRING"
    exit 1
fi

# Supprime le préfixe {xor} de la chaîne
password="${password#'{xor}'}"

# Decode la chaîne encodée en Base64
decoded_password=$(echo -n "$password" | openssl enc -base64 -d 2>/dev/null)

# Vérifie si le Base64 a été décodé correctement
if [ -z "$decoded_password" ]; then
    echo "Error: Invalid Base64 string"
    exit 1
fi

# Initialise la variable pour stocker le résultat de l'opération XOR
output=""

# XOR key correcte pour cet exercice Holberton / WebSphere
xor_key=170  # 0xAA

# Parcourt chaque caractère de la chaîne
for ((i=0; i<${#decoded_password}; i++)); do
    char="${decoded_password:$i:1}"
    xor_result=$(( $(printf "%d" "'$char") ^ xor_key ))
    output+=$(printf "\\$(printf '%03o' $xor_result)")
done

# Affiche le résultat
echo "$output"
