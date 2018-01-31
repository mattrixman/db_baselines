#! /usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ORIG="$(pwd)"

if [ $# != 1 ] ; then
    echo This script will build all of the baselines in this repo, to use it:
    echo 
    echo "    $ $0 <mysql-root-password>"
    echo 
    exit 1
fi

cd $DIR/empty
docker build . --build-arg password=$1 -t baseline:empty

cd $DIR/meta
docker build . -t baseline:meta

cd $ORIG
