# DEVELOPER DOCUMENTATION - Inception 

## ENVIRONMENT SET-UP FROM SCRATCH
### Prerequisites
* **Operating System**: Linux (Debian) or 42 Virtual Machine.
* **Required Tools**: `docker`, `docker compose`, and `make`.
* **Base Imange Standard**: All custom Dockerfiles are built on **Debian Bookworn** for deterministic dependency management.

### Configuration Files & Secrets
1. **Secrets Management**: Environment configurations are loaded via `srcs/.env`. Do **not** commit `srcs/.env to version control.
2. **Template Setup**: Copy the template file to generate your local configuration:
```bash
cp srcs/.env.example srcs/.env
```
3. **Variable Checklist**:
* **Database**: MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD, MYSQL_ROOT_PASSWORD, MYSQL_HOST
* **Site $ Domain**: DOMAINE_NAME, SITE_TITLE
* **WordPress Accounts**: WP_ADMIN_USER, WP_ADMIN_PASSWORD, WP_ADMIN_EMAIL, WP_USER, WP_PASSWORD, WP_EMAIL

## BUILD & LAUNCH

The root `Makefile` uses the `srcs/docker-compose.yml` file to orchestrate ocker compose execution.

To compile images and laumch all containers:
```bash
make
```

### Infrastructure Worflow
1. The Makefile ensures directories `/home/ael-ghaz/wordpress` and `/home/ael-ghaz/mariadb` exist on the host.
2. `docker compose` builds images specified in `srcs/requirements/` (nginx, wordpress, mariadb, redis).
3. Containers join the dedicated internal bridge network (inception_network).
4. Container entrypoint scripts set up initial database tables, WordPress Installation, and Redis object caching automatically.

## CONTAINERS/VOLUMES COMMANDS

### Viewing Logs
* **All services**:
```bash
docker compose -f srcs/docker-compose.yml logs -f
```
* **Single service logs**:
```bash
docker logs -f nginx
docker logs -f wordpress
docker logs -f mariadb
docker logs -f redis
```

### Executing Commads Inside Containers
* **Open an interactive shell:**
```bash
docker exec -it wordpress sh
docker exec -it mariadb sh
```

* **Database Inspection (MariaDB CLI)**
```bash
docker exec -it mariadb mariadb -u root -p
docker exec -it mariadb mariadb -u ${MYSQL_USER} -p${MYSQL_PASSWORD}
```
* **WordPress CLI(WP-CLI)**:
```bash
docker exec -it wordpress wp plugin list --allow-root
```

## STORAGES & PERSISTENCE
Data is bound to the host filesystem for persistence:
* **WordPress files:** `/home/ael-ghaz-data/wordpress` -> `/var/www/wordpress`
* **MariaDB storage:** `/home/ael-ghaz-data/mariadb` -> `/var/lib/mysql`

To inspect Docker volumes:
```bash
docker volume ls
docker volume inspect srcs_wordpress_data
docker volume inspect srcs_mariadb_data
```