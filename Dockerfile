FROM alpine:3.5
RUN apk add --no-cache git build-base bison automake autoconf bash
COPY Makefile.in /tmp/
COPY options.h /tmp/
COPY numbers.cc /tmp/
COPY moo.sh /
RUN mkdir /src && \
    mkdir /database && \
    cd /src && \
    git clone https://github.com/toddsundsted/stunt && \
    cd stunt && \
    cp /tmp/Makefile.in . && \
    cp /tmp/options.h . && \
    cp /tmp/numbers.cc . && \
    sh configure && \
    make
VOLUME ["/database"]
ENTRYPOINT ["/moo.sh"]
