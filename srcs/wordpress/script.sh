#!/bin/sh

cd /var/www/html

if [ -f "/var/www/html/index.php" ]; then
    echo -n ""
else
    wp --allow-root core download
fi

if [ -f "/var/www/html/wp-config.php" ]; then
    echo -n ""
else
    #allow-root obliger de le mettre car cmd executer en root
wp --allow-root config create --dbname=${WP_DBNAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST}
#init
wp --allow-root core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_USER} --admin_password=${WP_PASS} --admin_email=${WP_ADMIN_MAIL}
#init
wp --allow-root user create ${WP_USER} ${WP_USER_MAIL} --role=${WP_USER_ROLE} --user_pass=${WP_PASS}
#init
fi

exec "$@"