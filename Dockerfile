FROM alpine:3.9

RUN apk --no-cache add \
    rtorrent

WORKDIR /opt/rtorrent
COPY .rtorrent.rc .

EXPOSE 5000 50000
VOLUME ["/opt/rtorrent"]

ENTRYPOINT rm -f /opt/rtorrent/.session/rtorrent.lock && rtorrent -n -o import=/opt/rtorrent/.rtorrent.rc
