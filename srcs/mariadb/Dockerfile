FROM debian:bullseye

RUN apt update && apt install -y mariadb-server mariadb-client gettext-base

COPY maria.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /docker-entrypoint-initdb.d

COPY mysql.sql.template /docker-entrypoint-initdb.d/.

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY script.sh /entrypoint

RUN chmod +x /entrypoint

EXPOSE 3306

ENTRYPOINT ["/entrypoint"]

CMD [ "mysqld" ]