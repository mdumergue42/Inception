FROM debian:bullseye

RUN apt update && apt install -y mariadb-server mariadb-client gettext-base

COPY maria.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh /entrypoint

RUN chmod +x /entrypoint

EXPOSE 3306

ENTRYPOINT ["/entrypoint"]

CMD [ "mysqld" ]