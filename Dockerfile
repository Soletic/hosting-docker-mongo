FROM mongo:3.2.1
MAINTAINER Sol&TIC <serveur@soletic.org>

ENV DEBIAN_FRONTEND noninteractive

# Environment variable for host
ENV WORKER_NAME soletic
ENV WORKER_UID 10001

RUN apt-get -y update && apt-get install -y pwgen procps

VOLUME /var/log/mongodb

COPY start.sh /entrypoint.sh
COPY config.yml /etc/mongod.conf
RUN chmod u+x /entrypoint.sh