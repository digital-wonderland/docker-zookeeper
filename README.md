## About:

[Docker](http://www.docker.com/) image based on [digitalwonderland/base](https://registry.hub.docker.com/u/digitalwonderland/base/)

## Additional Software:

* [Apache ZooKeeper](http://zookeeper.apache.org/)

## Usage:

The container expects a ```HOST_IP``` environment variable to be set, which is used to generate a Zookeeper id (last part) and to retrieve cluster members from [etcd](https://coreos.com/using-coreos/etcd/) so your ```docker run``` line should be similar to

```
$ docker run -e HOST_IP=172.17.8.101 --name zookeeper-1 --publish 2181:2181 --publish 2888:2888 --publish 3888:3888 digitalwonderland/zookeeper
```
