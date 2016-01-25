FROM mongo:3.2.1
MAINTAINER Sol&TIC <serveur@soletic.org>

ENV DEBIAN_FRONTEND noninteractive

# Environment variable for host
ENV WORKER_NAME soletic
ENV WORKER_UID 10001

VOLUME /var/log/mongodb

COPY start.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh