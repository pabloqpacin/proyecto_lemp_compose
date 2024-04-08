#!/usr/bin/env bash

# NOTE: run as root

NOW=$(date '+%F-%Hh')

make_dump_in_container(){
    docker exec proyecto-db-1 sh -c \
        "if [ ! -d /var/lib/mysql/archivo-db ]; then
            mkdir /var/lib/mysql/archivo-db
        fi"

    docker exec proyecto-db-1 sh -c \
        "mariadb-dump -u root -ppassword helpdesk_core_php > /var/lib/mysql/archivo-db/$NOW.sql ||
            mysqldump -u root -ppassword helpdesk_core_php > /var/lib/mysql/archivo-db/$NOW.sql"
}

make_redundant_dump_in_local_fs(){
    if [ ! -d /mnt/archivo-db ]; then
        mkdir /mnt/archivo-db
    fi

    cp /var/lib/docker/volumes/proyecto_mysql_data/_data/archivo-db/$NOW.sql \
      /mnt/archivo-db/$NOW.sql
}

ensure_cronjob_twice_everyday(){
    if ! grep -qs 'exec-mysqldump.sh' /var/spool/cron/crontabs/$USER; then
        echo '0 6,18 * * * $HOME/PROYECTO/scripts/exec-mysqldump.sh' | \
            tee -a /var/spool/cron/crontabs/$USER
    fi
}

# ---

if true; then
    make_dump_in_container &&
    make_redundant_dump_in_local_fs

    ensure_cronjob_twice_everyday
fi


# NOW=$(date '+%F_%R')
# MES=$(date +%b)

    # echo '0 6,18 * * * $HOME/PROYECTO/scripts/exec-mysqldump.sh' | crontab -
    # EDITOR='vi -c pwd -c wq' crontab -e
