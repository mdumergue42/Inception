FROM debian:bullseye
#creer un VM sous debian

RUN apt update \
    && apt install -y curl php7.4 php-fpm php-mysqli \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
#execution
#l'outil wp-cli permet de gerer WP en ligne de com, automatisation de gestion et installation WP

RUN mkdir -p /run/php && chown www-data:www-data /run/php
#creer le doss qui va stock le socket de php + remet les drts sur le doss

COPY www.conf /etc/php/7.4/fpm/pool.d/

WORKDIR /var/www/html

COPY script.sh /entrypoint
#on le copy a la racine du container

RUN chmod +x /entrypoint

EXPOSE 9000

ENTRYPOINT ["/entrypoint"]
#la ou se trouve le script

CMD ["php-fpm7.4", "-F"]
#reste sur le pid1, cmd qui lance le moteur php