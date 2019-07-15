#!/usr/bin/env bash

set -e

/etc/init.d/ssh start &

echo "JAVA_HOME is ${JAVA_HOME}"

$HADOOP_HOME/sbin/start-dfs.sh &

echo "Started"

while true; do
    sleep 1h
done
