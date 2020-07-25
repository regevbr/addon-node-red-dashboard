#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Node-RED
# Configures NGINX for use with Node-RED
# ==============================================================================
declare admin_port
declare certfile
declare dns_host
declare ingress_interface
declare ingress_port
declare keyfile

ingress_port=$(bashio::addon.ingress_port)
ingress_interface=$(bashio::addon.ip_address)
sed -i "s/%%port%%/${ingress_port}/g" /etc/nginx/servers/ingress.conf
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/servers/ingress.conf

dns_host=$(bashio::dns.host)
sed -i "s/%%dns_host%%/${dns_host}/g" /etc/nginx/includes/resolver.conf

config_port=$(bashio::config 'port')
config_path=$(bashio::config 'path')
escaped_config_path=$(printf '%s\n' "$config_path" | sed -e 's/[\/&]/\\&/g')
sed -i "s/%%config_port%%/${config_port}/g" /etc/nginx/includes/upstream.conf
sed -i "s/%%config_path%%/${escaped_config_path}/g" /etc/nginx/servers/ingress.conf
