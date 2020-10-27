FROM alpine:latest

RUN apk update && \
    apk --no-cache add nginx && \
    mkdir /run/nginx && \
    chown nginx: /run/nginx && \
    rm -f /etc/nginx/conf.d/default.conf

COPY ./default.conf /etc/nginx/conf.d/default.conf

USER nginx

STOPSIGNAL SIGTERM

ENTRYPOINT ["nginx", "-g", "daemon off;"]
