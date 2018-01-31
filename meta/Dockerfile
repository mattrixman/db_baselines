# see https://stackoverflow.com/a/34410503/1054322 for discussion
FROM baseline:empty

#ARG password
#ENV MYSQL_ROOT_PASSWORD=${password}

# stage the migration script
COPY ./db/ /tmp/db/

# start up mysql and create meta
RUN rm -f /tmp/done \
&& /docker-entrypoint.sh mysqld & sleep 10 \
&& cd /tmp/db/ \
&& ./migrate setup --password $MYSQL_ROOT_PASSWORD \
&& killall mysqld
