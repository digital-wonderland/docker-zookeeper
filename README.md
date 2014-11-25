## About:

[Docker](http://www.docker.com/) image based on [digitalwonderland/base](https://registry.hub.docker.com/u/digitalwonderland/base/)

## Additional Software:

* [Apache ZooKeeper](http://zookeeper.apache.org/)

## Usage:

The container can be configured via environment variables:

| Environment Variable | Zookeeper Property | Default |
| -------------------- | ------------------ | --------|
| ```ZOOKEEPER_ID``` | N/A | ```1``` |
| ```ZOOKEEPER_TICK_TIME``` | ```tickTime``` | ```2000``` |
| ```ZOOKEEPER_INIT_LIMIT``` | ```initLimit``` | ```10``` |
| ```ZOOKEEPER_SYNC_LIMIT``` | ```syncLimit``` | ```5``` |
| ```ZOOKEEPER_CLIENT_CNXNS``` | ```maxClientCnxns``` | ```60``` |
| ```ZOOKEEPER_AUTOPURGE_SNAP_RETAIN_COUNT``` | ```autopurge.snapRetainCount``` | ```3``` |
| ```ZOOKEEPER_AUTOPURGE_PURGE_INTERVAL``` | ```autopurge.purgeInterval``` | ```0``` |

So, if you are happy with the default, just run the container to get Zookeeper in standalone mode.

To run a cluster just set more ```ZOOKEEPER_SERVER_X``` environment variables (replace ```X``` with the respective id) set to the respective ip.

**Note:** A more dynamic configuration is not possible with Zookeeper 3.4 which might change with v3.5.
