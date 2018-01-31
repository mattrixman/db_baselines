#! /usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -ne 2 ] ; then
    echo This script will add links to your database migration scripts so they 
    echo can be used for containerized database creation.  Use it like this:
    echo 
    echo "    $ $0 /path/to/server/db/ /path/to/billing-server/billing-server/db"
    echo 
    exit 1
fi

# can we find server db script?
if [ ! -d $1 ] ; then
    echo $1 must be a directory
    exit 2
fi
if [ ! -x $1/migrate ] ; then
    echo $1 must be executable
    exit 3
fi


# can we find billing-server db script?
if [ ! -d $2 ] ; then
    echo $2 must be a directory
    exit 2
fi
if [ ! -x $1/migrate ] ; then
    echo $1 must be executable
    exit 3
fi

rm -rf $DIR/meta/db
cp -r $1 $DIR/meta

rm -rf $DIR/bill/db
cp -r $2 $DIR/bill

