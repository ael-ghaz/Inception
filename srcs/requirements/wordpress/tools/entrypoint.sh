#!/bin/sh

if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp


if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp core download --allow-root

    wp config create \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpassword=${MYSQL_PASSWORD} \
        --dbhost=${MYSQL_HOST} \
        --allow-root
    
    wp core install \
        --url=${DOMAINE_NAME} \
        --title=${SITE_TITLE} \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root

    wp user create \
        ${WP_USER} ${WP_EMAIL} \
        --role=author \
        --user_pass=${WP_PASSWORD} \
        --allow-root

fi

exec "$@"