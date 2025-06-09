#!/usr/bin/env bash
echo "Ejecutando hook pre-push..."

echo "Verificando estilo de archivos de python con flake8..."
flake8 || {
  echo "flake8 encontró errores de estilo. Corregir y hacer un commit para continuar."
  exit 1
}

echo "Verificando estilo de scripts de bash con shellcheck..."
archivos_sh=$(find . -type f -name ".sh") # Se buscan recursivamente los archivos con nombre ".sh"
if [ -n "$archivos_sh" ]; then
  shellcheck $archivos_sh || {
    echo "shellcheck encontró errores en scripts .sh"
    exit 1
  }
else
  echo "No se encontraron scripts .sh para analizar"
fi

echo "Verificando estilo de archivos de terraform..."

echo "Ejecutando tflint..."
tflint  || {
  echo "tflint encontró errores"
  exit 1
}
echo "Ejecutando terraform validate..."
if [ -d "iac" ]; then
  terraform -chdir=iac validate || { # Solo se ejecuta el comando dentro del módulo iac/
    echo "terraform validate falló"
    exit 1
  }
else
  echo "Directorio 'iac' no encontrado. Omitiendo ejecución de terraform validate..."
fi