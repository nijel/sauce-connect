FROM debian:buster-slim
MAINTAINER Michal Čihař <michal@cihar.com>
ENV VERSION 4.5.4
LABEL version=$VERSION

WORKDIR /app

RUN apt-get update -qqy \
 && apt-get install -qqy wget \
 && apt-get clean

RUN wget https://saucelabs.com/downloads/sc-$SAUCE_VERSION-linux.tar.gz -O - | tar -xz --strip 1

ENTRYPOINT ["/app/bin/sc"]

CMD ["--version"]
