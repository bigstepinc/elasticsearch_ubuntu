FROM docker.elastic.co/elasticsearch/elasticsearch:6.1.2

ENV CLUSTER_NAME="mycluster"
ENV DISCOVERY_ZEN_PING_UNICAST_HOSTS="172.17.0.2"
ENV DISCOVERY_ZEN_MINIMUM_MASTER_NODES="1"
ENV PATH_DATA="/usr/share/elasticsearch/lib/"
ENV PATH_LOGS="/usr/share/elasticsearch/lib/"
ENV USERNAME="elastic"
ENV ELASTIC_PASSWORD="changeme"
ENV ES_JAVA_OPTS=""


COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chgrp 0 /usr/local/bin/docker-entrypoint.sh && \
    chmod g=u /etc/passwd && \
    chmod 0775 /usr/local/bin/docker-entrypoint.sh

EXPOSE 9200 9300

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["eswrapper"]
