FROM --platform=$BUILDPLATFORM  mcr.microsoft.com/dotnet/aspnet:8.0 AS BUILD

MAINTAINER Patryk Olszak, <patryk1711711@gmail.com>

RUN apt-get update && apt-get -y install curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]