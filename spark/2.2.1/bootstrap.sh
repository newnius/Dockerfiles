#! /bin/bash
# replace config

cp /mnt/config/spark/* $SPARK_HOME/conf

bash -c "/etc/bootstrap.sh -d"
