FROM alpine:latest

ARG PUID
ARG PGID

# Latest releases available at https://github.com/aptible/supercronic/releases
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.24/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=6817299e04457e5d6ec4809c72ee13a43e95ba41

RUN apk add --update \
    && apk upgrade \
    && apk --no-cache add bind-tools curl


RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic


RUN addgroup -g ${PGID} dnscron && \
    adduser -D -u ${PUID} -G dnscron dnscron;

COPY --chown=dnscron:dnscron getip.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/getip.sh

COPY --chown=dnscron:dnscron crontab.txt /home/dnscron/crontab
RUN crontab /home/dnscron/crontab


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER crontab

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
