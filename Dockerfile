FROM --platform=$BUILDPLATFORM  mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS BUILD

MAINTAINER Patryk Olszak, <patryk1711711@gmail.com>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]