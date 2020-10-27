FROM debian:buster-slim

COPY app /app
WORKDIR /app

RUN apt-get update \
   && apt-get --no-install-recommends install -y curl wget unzip \
   && apt-get autoclean \
   && rm -rf /var/lib/apt/lists/* \
   && useradd -ms /bin/bash foo \
   && mkdir /config \
   && chown -R foo:foo /app \
   && chown -R foo:foo /config

USER foo

CMD ./start.sh
