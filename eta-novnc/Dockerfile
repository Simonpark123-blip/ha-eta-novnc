ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM $BUILD_FROM

RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    nginx

RUN git clone --depth 1 https://github.com/novnc/noVNC.git /opt/noVNC

RUN git clone --depth 1 https://github.com/novnc/websockify.git /opt/websockify

RUN pip3 install --break-system-packages \
    numpy

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]