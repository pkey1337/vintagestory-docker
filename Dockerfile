FROM alpine:3.11

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing/' >> /etc/apk/repositories
RUN apk update && apk add mono mono-dev tmux curl screen ca-certificates bash vim
RUN cert-sync /etc/ssl/certs/ca-certificates.crt

RUN addgroup -g 49494 vintage && adduser -u 49494 -D vintage -s /bin/bash -G vintage
WORKDIR "/home/vintage"

COPY vintage-start.sh ./
RUN mkdir server data && \
    wget -P server/ https://cdn.vintagestory.at/gamefiles/stable/vs_server_1.12.5.tar.gz && \
    tar -xzf server/vs_server_1.12.5.tar.gz -C server/
RUN chown -R vintage:vintage . && chmod 750 vintage-start.sh

USER vintage
EXPOSE 42420
ENTRYPOINT /home/vintage/vintage-start.sh