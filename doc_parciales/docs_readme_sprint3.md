> - Autor: Daren Herrera Romo
> - Fecha de creación: 19/6/2025

# Proyecto 7 - Operaciones y recuperación ante desastres locales para infraestructura Terraform

**Integrantes**
- Daren Adiel Herrera Romo (scptx0)
- Renzo Quispe Villena (RenzoQuispe)
- Andre Sanchez Vega (AndreSanchezVega)

## Videos grupales

- [Video de sprint 1](https://unipe-my.sharepoint.com/:v:/g/personal/daren_herrera_r_uni_pe/EYXxNwB6cb9OmSLQNa7B8q4B7q1i92Xruj1x8dw18KKDHg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=dMGP9e)

## Descripción general del proyecto

Solución local para manejar el ciclo de vida completo de una infraestructura dummy de Terraform:
- Backup/restauración de estado
- Alta disponibilidad
- Balanceador de carga local en Python
- Simulación de drift
- Gestión de costos simulados mediante scripts bash

## Descripción de scripts

`backup_state.sh`
- Crea una carpeta `backups/`, si no existe, para almacenar todos los archivos de respaldo.
- Se genera el nombre del backup añadiendo un timestamp, con formato `YYYY-MM-DD_HH-MM-SS`, al final.
- Se inserta el estado actual (en el momento de la ejecución del script) del archivo de estado de terraform `terraform.tfstate`. 

`restore_state.sh`
- Lee todos los archivos de respaldo en la carpeta `backups/` y verifica que haya al menos un archivo.
- Muestra una lista de los archivos de respaldo y le pide al usuario escribir el número correspondiente al backup que quiere restaurar.
- Copia el archivo de respaldo a la ruta de `terraform.tfstate` (en `iac/`) y restaura el estado.

`simulate_drift.sh`
- Usa `sed` para cambiar el nombre de uno de los recursos en `iac/main.tf`
- Ejecuta `terraform init` y `terraform plan` para ver el drift.
- Se almacena el drift del estado en un archivo de log en `logs/`.

`simulate_requests.sh`
- Crea la carpeta `balanceador/incoming_requests/`.
- Crea 10 requests (archivos) dentro de la carpeta creada anteriormente.

`balanceador.py`
- Crea e inicializa servicios.
- Distribuye el procesamiento de los archivos de `incoming_requests`.
- Se ejecuta infinitamente en modo daemon con delay de 5 segundos.
- Realiza un health-check cada 10 segundos para ver que servicios están activos.
- Si hay un error con el procesamiento del archivo, se traslada a `errors/`.
- Crea y actualiza logs que permiten visualizar que archivos ha procesado cada servicio. 

## Estructura principal del proyecto

```
├── iac/                        # Infraestructura
│   └── main.tf                 # Recursos dummy (null_resource)
├── scripts/
│   ├── backup_state.sh         # Script de backup de tfstate con timestamp
│   ├── restore_state.sh        # Script para restauración interactiva
│   ├── cost_saving.sh          # Script para "ahorro de energía"
│   ├── simulate_requests.sh    # Script para simular cargas de procesamiento (archivos)
│   └── simulate_drift.sh       # Script para simular un desplazamiento en el estado
├── balanceador/
│   ├── balanceador.py          # Balanceador (Python)
│   ├── incoming_requests/      # Carpeta para solicitudes
│   ├── logs/                   # Carpeta de logs
│   ├── config_services.json    # Configuración de servicios activos
│   └── settings.json           # Delay de ejecución de balanceador.py
└── tests/
    └── test_balanceador.py     # Script de backup de tfstate con timestamp    
```

## Requisitos técnicos

| Herramientas | Versión       |
|--------------|---------------|
| Python       | >= 3.10   |
| Terraform    | 1.12.1        |
| Bash         | >= 5.1.16 |

## ¿Cómo usar el proyecto?

1. Clonar el repositorio

```bash
git clone https://github.com/Grupo-9-CC3S2/Proyecto-7.git
```

2. Usar los scripts
- `simulate_requests.sh + balanceador.py` 
    ```bash
    make daemon_log
    bash scripts/simulate_requests.sh # tambien con chmod +x y ./
    nohup python balanceador/balanceador.py > balanceador/logs/daemon.log 2>&1 &
    # Usar Ctrl + C para finalizar el proceso
    ```

    Luego de haber iniciado la ejecución del balanceador, podemos insertar archivos en `incoming_requests` y el balanceador los irá leyendo y distribuyendo entre los servicios.


## Diagrama ASCII del flujo de balanceo y backup/restauración.

Balanceo

```
[incoming_requests/] 
      |
      v
[balanceador.py] --(health check)--> [service_1/ service_2/ ...]
      |
      v
[Renombra y mueve archivo a service_<id>/]
      |
      v
[logs/load_<n>.json]
      |
      v
[errors/] (si hay error)
```