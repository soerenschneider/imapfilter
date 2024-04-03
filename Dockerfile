FROM alpine:3.19.1

# renovate: datasource=github-tags depName=lefcha/imapfilter
ARG IMAPFILTER_VERSION=v2.8.2

RUN apk add --update --no-cache git lua-dev gcc make openssl-dev pcre2-dev g++ && \
    git clone --depth 1 --branch="${IMAPFILTER_VERSION}" https://github.com/lefcha/imapfilter.git && \
    cd imapfilter && \
    make -j all && \
    make install && \
    apk del git g++ gcc make

ENTRYPOINT ["/usr/local/bin/imapfilter"]
