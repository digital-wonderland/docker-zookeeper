[![Docker Stars](https://img.shields.io/docker/stars/digitalwonderland/zookeeper.svg)](https://hub.docker.com/r/digitalwonderland/zookeeper/) [![Docker Pulls](https://img.shields.io/docker/pulls/digitalwonderland/zookeeper.svg)](https://hub.docker.com/r/digitalwonderland/zookeeper/) [![](https://images.microbadger.com/badges/image/digitalwonderland/zookeeper.svg)](https://microbadger.com/images/digitalwonderland/zookeeper)

# About:

[Docker](http://www.docker.com/) image based on [openjdk:8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile)

# Additional Software:

* [Apache ZooKeeper](http://zookeeper.apache.org/)

# Usage:

## General Configuration:

ZooKeeper can be configured via environment variables:

| Environment Variable | Zookeeper Property | Default |
| -------------------- | ------------------ | --------|
| ```ZOOKEEPER_ID``` | N/A | ```1``` |
| ```ZOOKEEPER_TICK_TIME``` | ```tickTime``` | ```2000``` |
| ```ZOOKEEPER_INIT_LIMIT``` | ```initLimit``` | ```10``` |
| ```ZOOKEEPER_SYNC_LIMIT``` | ```syncLimit``` | ```5``` |
| ```ZOOKEEPER_CLIENT_CNXNS``` | ```maxClientCnxns``` | ```60``` |
| ```ZOOKEEPER_AUTOPURGE_SNAP_RETAIN_COUNT``` | ```autopurge.snapRetainCount``` | ```3``` |
| ```ZOOKEEPER_AUTOPURGE_PURGE_INTERVAL``` | ```autopurge.purgeInterval``` | ```0``` |

## Standalone Mode:

If you are happy with the defaults, simply run the container:

```
$ docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888 digitalwonderland/zookeeper
```

## Clustered Mode:

To run a cluster, just add more ```ZOOKEEPER_SERVER_X``` environment variables (replace ```X``` with the respective id) set to the respective ip address.

For example to run a cluster on ```172.17.8.101```, ```172.17.8.102``` and ```172.17.8.103```, run the following on the respective hosts:

On ```172.17.8.101```:

```
$ docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888 -e ZOOKEEPER_ID=1 -e ZOOKEEPER_SERVER_1=172.17.8.101 -e ZOOKEEPER_SERVER_2=172.17.8.102 -e ZOOKEEPER_SERVER_3=172.17.8.103 digitalwonderland/zookeeper
```

On ```172.17.8.102```:

```
$ docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888 -e ZOOKEEPER_ID=2 -e ZOOKEEPER_SERVER_1=172.17.8.101 -e ZOOKEEPER_SERVER_2=172.17.8.102 -e ZOOKEEPER_SERVER_3=172.17.8.103 digitalwonderland/zookeeper
```

On ```172.17.8.103```:

```
$ docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888 -e ZOOKEEPER_ID=3 -e ZOOKEEPER_SERVER_1=172.17.8.101 -e ZOOKEEPER_SERVER_2=172.17.8.102 -e ZOOKEEPER_SERVER_3=172.17.8.103 digitalwonderland/zookeeper
```


**Note:** A more dynamic configuration is not possible with Zookeeper v3.4 [which will change with v3.5](https://zookeeper.apache.org/doc/trunk/zookeeperReconfig.html).
