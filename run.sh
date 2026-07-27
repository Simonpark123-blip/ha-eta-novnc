#!/usr/bin/with-contenv bashio

VNC_HOST=$(bashio::config 'vnc_host')
VNC_PORT=$(bashio::config 'vnc_port')
VNC_PASSWORD=$(bashio::config 'vnc_password')

bashio::log.info "Starte ETA noVNC"
bashio::log.info "VNC Ziel: ${VNC_HOST}:${VNC_PORT}"

if [ -n "$VNC_PASSWORD" ]; then
    bashio::log.info "VNC-Passwort ist gesetzt"

    echo "$VNC_PASSWORD" > /tmp/vnc_password
    chmod 600 /tmp/vnc_password

    /opt/websockify/run \
        --web /opt/noVNC \
        --websockify-token-plugin TokenFile \
        6080 \
        "${VNC_HOST}:${VNC_PORT}" &
else
    bashio::log.info "Kein VNC-Passwort konfiguriert"

    /opt/websockify/run \
        --web /opt/noVNC \
        6080 \
        "${VNC_HOST}:${VNC_PORT}" &
fi

wait