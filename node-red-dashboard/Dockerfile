ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:11.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache \
        nginx=1.20.2-r0 \
    \
    && rm -fr \
        /tmp/* \
        /etc/nginx

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Node-Red Dashboard" \
    io.hass.description="Gain access to the Node-RED dashboard from the sidebar" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    org.opencontainers.image.title="Node-Red Dashboard" \
    org.opencontainers.image.description="Gain access to the Node-RED dashboard from the sidebar" \
    org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.url="https://github.com/regevbr/addon-node-red-dashboard" \
    org.opencontainers.image.source="https://github.com/regevbr/addon-node-red-dashboard" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
