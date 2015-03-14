#!/bin/bash

# report version number of hadoop components

if [[ $1 == "hadoop" ]]
then
  hadoop version | sed -n 's/^.*Hadoop \([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p'
elif [[ $1 == "hbase" ]]
then
  hbase version 2>&1 | sed -n 's/^.*HBase \([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p'
elif [[ $1 == "hive" ]]
then
  hive --version 2>&1 | sed -n 's/^.*Hive \([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p'
elif [[ $1 == "zookeeper" ]]
then
  echo status | nc localhost 2181 | sed -n 's/^.*Zookeeper version: \([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p'
fi
exit 0
