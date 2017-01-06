# Apache Zookeeper

FROM digitalwonderland/base:latest

ARG ZOOKEEPER_VERSION=3.4.9
ARG ZOOKEEPER_MIRROR=http://mirrors.sonic.net

ADD ./src /

RUN chmod +x /usr/local/sbin/start.sh

RUN yum install -y java-1.7.0-openjdk-headless tar && yum clean all

RUN curl -sS ${ZOOKEEPER_MIRROR}/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /opt \
  && mv /opt/zookeeper-* /opt/zookeeper \
  && chown -R root:root /opt/zookeeper

RUN groupadd -r zookeeper \
  && useradd -c "Zookeeper" -d /var/lib/zookeeper -g zookeeper -M -r -s /sbin/nologin zookeeper \
  && mkdir /var/lib/zookeeper \
  && chown -R zookeeper:zookeeper /var/lib/zookeeper

EXPOSE 2181 2888 3888

VOLUME ["/opt/zookeeper/conf", "/var/lib/zookeeper"]

ENTRYPOINT ["/usr/local/sbin/start.sh"]
