#! /usr/bin/env bash

ZOOKEEPER_ID="${HOST_IP##*.}"

echo $ZOOKEEPER_ID > /var/lib/zookeeper/myid

confd -node ${HOST_IP}:4001 -onetime

sed -ie "s/^server\.${ZOOKEEPER_ID}=.*$/server\.${ZOOKEEPER_ID}=0\.0\.0\.0:2888:3888/" /opt/zookeeper/conf/zoo.cfg

su zookeeper -s /bin/bash -c "/opt/zookeeper/bin/zkServer.sh start-foreground"
