#! /usr/bin/env bash

# Fail hard and fast
set -eo pipefail

if [ -z "$HOST_IP" ]; then
  echo "\$HOST_IP not set"
  exit -1
else
  echo "HOST_IP=$HOST_IP"
fi

if [ -z "$ZOOKEEPER_ID" ]; then
  ZOOKEEPER_ID="${HOST_IP##*.}"
fi
echo "ZOOKEEPER_ID=$ZOOKEEPER_ID"

echo $ZOOKEEPER_ID > /var/lib/zookeeper/myid

confd -node ${HOST_IP}:4001 -onetime

sed -ie "s/^server\.${ZOOKEEPER_ID}=.*$/server\.${ZOOKEEPER_ID}=0\.0\.0\.0:2888:3888/" /opt/zookeeper/conf/zoo.cfg

su zookeeper -s /bin/bash -c "/opt/zookeeper/bin/zkServer.sh start-foreground"
