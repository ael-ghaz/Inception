# USER DOC - Inception

This project intends to create a movable application that connects differents Web centered technologies and services.

## Services
The stack provides multiple services:
* **Nginx**: Web server serving as the single HTTPS entry point (Port 443 with TLS v1.2/v1.3).
* **WordPress + PHP-FPM**: Content Management System executing backend logic via PHP-FPM.
* **MariaDB**: Relational database storing all WordPress data.
* **Redis Cache**: In-memory data structure store used as an object cache to accelerate WordPress database queries.


## Start/Stop Project
All manaement operations are automateed via the root `Makefile`.

* **Start the infrastucture:**
```bash
    make
```
* **Stop the infrastucture:**
```bash
    make down
```
* **Clean containers, networks and images:**
```bash
    make clean
```
* **Full clean (including volumes deletion):**
```bash
    make fclean
```
* **Rebuild from scratch:**
```bash
    make re
```

## Website & Admin Panel
### Host Configuration
Before accessing the site, add this line in your `/etc/hosts` file:
```
127.0.0.1 ael-ghaz.42.fr
    
```
### URLs
* **Public Website:** https://ael-ghaz.42.fr
* **Wordpress Admin Panel:** https://ael-ghaz.42.fr/wp-admin

## Locating & Managing Credentials
Credentials and environment variables re centrally managed in srcs/.env (wich is gi-ignored for security).

To locate or update logn details:
1.  Open srcs/.env with a tect editor.
2.  Locate the relevant keys:
* **Wordpress Administrator:** WP_ADMIN_USER and WP_ADMIN_PASSWORD
* **Wordpress Standard User:** WP_USER and WP_PASSWORD
* **MariaDB Database User:** MYSQL_USER and MYSQL_PASSWORD
* **MariaDB Root Account:** MYSQL_ROOT_PASSWORD

## Checks Services Status

* **List running containers:**
```bash
docker ps
```
(exemples: nginx, wordpress, mariadb and redis containers).
* **Verify Redis Cache status:**
```bash
docker exec -it wordpress wp redis status --allow-root
```
(output should be `Status: Connected`).
* **Monitor active Redis operations in real time:**
```bash
docker exec -it redis redis-cli monitor
```
(should print query requests).