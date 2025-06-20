# Contribuciones de Daren Herrera

## Sprint 1
- 2025-06-08:
    - **Rama feature/infraestructura-inicial**
        - Creé la estructura principal de directorios (`iac/`, `scripts/`, `src/`), archivos vacíos (`backup_state.sh`, `restore_state.sh`, `balanceador.py`, `main.tf`). Además indiqué el esqueleto inicial del `README`.
            - Commits:
                - `feat(structure): (Issue #1) crear estructura inicial del proyecto` ([327d33c](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/327d33c04ca3d7e50e063e4f8a0806a810c05ad8))
                - `docs(readme): (Issue #1) actualizar README con esqueleto inicial` ([f64c21e](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/f64c21e55283bc25fb3acad8c571e89bac82d038))
        - En `iac/main.tf` creé tres recursos dummy que generan 3 archivos `service_*.txt`.
            - Commits:
                - `feat(tf): (Issue #3) agregar iac/main.tf con tres recursos null_resource dummy` ([b83e905](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/b83e9057407ce86e0c8b61cc1f87a729458cb583))
                - `docs(tf): (Issue #3) agregar comentario explicativo de los recursos de main.tf` ([196b72f](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/196b72f9a61f7eaf5b765c9549f8361820805bc6))
        - Pull request grupal: [#10](https://github.com/Grupo-9-CC3S2/Proyecto-7/pull/10)
- 2025-06-09:
    - Creé los git hooks que se usarán en el proyecto. No hubo commit de ello.
- 2025-06-10 y 2025-06-11:
    - **Rama docs/readme-video**
        - Agregué documentación breve (README) de la descripción del proyecto y los scripts.
            - Commits:
                - `docs(readme): (Issue #9) actualizar README con avance final del sprint 1` ([7f12cfc](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/7f12cfcdef223c8383ffa0f76a7bd49f04f7e478))
        - Hice el video correspondiente del sprint 1.
        - Pull request grupal: [#23](https://github.com/Grupo-9-CC3S2/Proyecto-7/pull/23)
    - Hice el merge de la rama `feature/drift-balanceador` sobre `develop`:
        - Commits:
            - `Merge pull request #13 de feature/drift-balanceador sobre develop` ([81b32cd](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/81b32cd01317fd66811670dced17e5e0409b8ab7))
- 2025-06-12:
    - **Rama docs/readme-video**
        - Uní los videos del sprint 1 y se agregó al README
            - Commits:
                - `docs(video): (Issue #8) agregar url de video grupal del sprint 1` ([da18b80](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/da18b80e9d011b3f41d7ea5fea7aeb7c5c93b864))
        -  Pull request grupal: [#23](https://github.com/Grupo-9-CC3S2/Proyecto-7/pull/23)
    - **Rama refactor/scripts**
        - Hice correciones en los scripts y la estructura duplicada de `balanceador.py`
            - Commits:
                - `refactor(py): (Issue #14) unificar estilo PEP8 en balanceador.py` ([0d4c555](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/0d4c555ddb258b48b7c1067ea14463e3949091e9))
                - `refactor(sh): (Issue #14) correcciones de scripts del sprint 1` ([6e55bfe](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/6e55bfe679de4a06d4390cd98bab259a342ef228))
                - `feat(structure): (Issue #1) eliminar estructura duplicada de balanceador` ([b69d7b6](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/b69d7b6c7049f777d3812a41fae12208fa2c0526))
        - Pull request grupal: [#24](https://github.com/Grupo-9-CC3S2/Proyecto-7/pull/24)

## Sprint 2
- 2025-06-13 y 2025-06-14:
    - **Rama feat/balanceador-logica**
        - Implementé la lógica principal de `balanceador.py`
            - Commits:
                - `feat(py): (Issues #15 #16 #17) agregar logica inicial de balanceador.py` ([98eea9b](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/98eea9ba08e468e4c20054529d5976459eada1d6))
        - Pull request grupal: [#26](https://github.com/Grupo-9-CC3S2/Proyecto-7/pull/26)
- 2025-06-16:
    - Hice el video para el sprint 2
    
## Sprint 3
- 2025-06-17, 2025-06-18 y 2025-06-19
    - Hice el merge de la rama `feature/simulate-requests` sobre `develop`
        - Commits:
            - `Merge pull request #34 from Grupo-9-CC3S2/feature/simulate-requests` ([b168907](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/b1689072f4e9a836619ddae99ca8a99057bafaeb))
    - **Rama feat/health-check-balanceador**
        - Implementé la mejora de `balanceador.py` con el health-check de los servicios activos. Además, implemente tests para el balanceador.
            - Commits:
                - `feat(py): (Issues #27 #28) health-check de servicios en el balanceador` ([ce65764](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/ce6576487333902a4a95e9bee7f57a19e3739a20))
                - `test(py): agregar tests principales para el balanceador` ([be00597](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/be00597e349310f195ef328f0b1515beff9f7758))
                - `refactor(py): unificar estilo PEP8 para health-check de balanceador` ([40d5d6f](https://github.com/Grupo-9-CC3S2/Proyecto-7/commit/40d5d6f5bc862697b6f2c34602d1be7b861372c6))
        - Pull request grupal: [#35](https://github.com/Grupo-9-CC3S2/Proyecto-7/pull/35)
    - Hice el video para el sprint 3