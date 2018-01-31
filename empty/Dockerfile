# see https://stackoverflow.com/a/34410503/1054322 for discussion
FROM percona:5.7

# install python (for migration scripts)
RUN apt-get update && apt-get upgrade -y && apt-get install -y python

ARG password
ENV MYSQL_ROOT_PASSWORD=${password}

# /var/lib/mysql is a volume, we want the data to be internal to this container, so look elsewhere
RUN sed -i 's|/var/lib/mysql|/var/lib/mysql2|g' /etc/mysql/my.cnf

RUN /docker-entrypoint.sh mysqld & sleep 30 && killall mysqld
