ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM ${BUILD_FROM}

RUN apk add --no-cache gammu gammu-smsd bash

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
