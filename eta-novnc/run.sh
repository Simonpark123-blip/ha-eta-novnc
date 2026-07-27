#!/usr/bin/with-contenv bashio

VNC_HOST=$(bashio::config 'vnc_host')
VNC_PORT=$(bashio::config 'vnc_port')

bashio::log.info "Starte ETA noVNC"
bashio::log.info "VNC Ziel: ${VNC_HOST}:${VNC_PORT}"

exec /opt/websockify/run \
    --web /opt/noVNC \
    6080 \
    "${VNC_HOST}:${VNC_PORT}"