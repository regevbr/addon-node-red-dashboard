#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Node-RED dashboard
# Configures NGINX for use with Node-RED dashboard
# ==============================================================================

bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    | tempio \
        -template /etc/nginx/templates/ingress.gtpl \
        -out /etc/nginx/servers/ingress.conf

bashio::var.json \
    dns_host "$(bashio::dns.host)" \
    | tempio \
        -template /etc/nginx/templates/resolver.gtpl \
        -out /etc/nginx/includes/resolver.conf
