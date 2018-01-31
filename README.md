# To use

To ensure that the locally-built images are set-up to build with the database migration scripts:

    ./update.sh /path/to/server/db/ /path/to/billing-server/billing-server/db

To actually build them:

    ./build.sh <mysql-root-pass>

To launch a baseline container on port 3307:

    docker run --rm --name basedb_meta1 -p 3307:3306 basedb_meta:latest

To connect to that baseline:

    mysql -uroot -p<mysql-root-pass> -P 3307
