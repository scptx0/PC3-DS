# PC3

- **Nombre completo:** Daren Adiel Herrera Romo
- **Correo institucional:** `daren.herrera.r@uni.pe`
- **URL del repositorio grupal:** https://github.com/Grupo-9-CC3S2/Proyecto-7
- **Rol en el equipo:**
    - Contribuí en la creación de:
        - Issues
        - Tablero Kanban
        - Pull requests
        - `README`
    - Implementé:
        - Git hooks
        - `balanceador.py`
        - `makefile`
        - `test_balanceador.py`
    - Me encargué de:
        - Definir las reglas generales de cómo se trabajará
        - Implementar el balanceador con todas sus características
        - Implementar los 3 recursos dummy de terraform

## Instrucciones para reproducir el código

Implementé todo el balanceador, el cual no se puede ejecutar sin algunos scripts que no hice. Por lo que para poder hacerlo, se tiene que usar el repositorio grupal y ejecutar los siguientes pasos.

```bash
# Clonar repositorio
git clone https://github.com/Grupo-9-CC3S2/Proyecto-7.git

cd Proyecto-7
# En la raiz
make daemon_log
bash scripts/simulate_requests.sh # tambien con chmod +x y ./
nohup python balanceador/balanceador.py > balanceador/logs/daemon.log 2>&1 &
# Usar Ctrl + C para finalizar el proceso
```

Para hacer los tests del balanceador:

```bash 
make test
```

Realicé también un script auxiliar que genera requests, se puede ejecutar así:

```bash
bash generate_requests.sh
``` 