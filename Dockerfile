FROM alpine:3.8

RUN apk --no-cache add \
    rtorrent

WORKDIR /opt/rtorrent
COPY .rtorrent.rc .

EXPOSE 5000 50000
VOLUME ["/opt/rtorrent"]

ENTRYPOINT ["rtorrent", "-n", "-o", "import=/opt/rtorrent/.rtorrent.rc"]
