# Apache Zookeeper

FROM digitalwonderland/base:latest

ADD ./src /

RUN chmod +x /usr/local/sbin/start.sh

RUN yum install -y java-1.7.0-openjdk-headless tar && yum clean all

RUN curl -sS http://mirrors.sonic.net/apache/zookeeper/current/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt \
  && mv /opt/zookeeper-* /opt/zookeeper \
  && chown -R root:root /opt/zookeeper

RUN groupadd -r zookeeper \
  && useradd -c "Zookeeper" -d /var/lib/zookeeper -g zookeeper -M -r -s /sbin/nologin zookeeper \
  && mkdir /var/lib/zookeeper \
  && chown -R zookeeper:zookeeper /var/lib/zookeeper

EXPOSE 2181 2888 3888

VOLUME ["/opt/zookeeper/conf", "/var/lib/zookeeper"]

ENTRYPOINT ["/usr/local/sbin/start.sh"]
