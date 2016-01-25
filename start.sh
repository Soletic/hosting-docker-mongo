#!/bin/bash
set -e

usermod -u ${WORKER_UID} mongodb
groupmod -g ${WORKER_UID} mongodb

if [ "${1:0:1}" = '-' ]; then
    set -- mongod "$@"
fi

if [ "$1" = 'mongod' ]; then
    
    chown -R mongodb:mongodb /var/log/mongodb /data/db

    numa='numactl --interleave=all'
    if $numa true &> /dev/null; then
        set -- $numa "$@"
    fi

    exec gosu mongodb "$@"
fi

exec "$@"
