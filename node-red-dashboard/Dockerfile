ARG BUILD_FROM=hassioaddons/base:8.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
        g++=9.3.0-r2 \
        gcc=9.3.0-r2 \
        libc-dev=0.7.2-r3 \
        linux-headers=5.4.5-r1 \
        make=4.3-r0\
    \
    && apk add --no-cache \
        git=2.26.2-r0 \
        lua-resty-http=0.15-r0 \
        nginx-mod-http-lua=1.18.0-r0 \
        nginx=1.18.0-r0  \
        openssh-client=8.3_p1-r0 \
        patch=2.7.6-r6 \
    \
    && apk del --no-cache --purge .build-dependencies \
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
    io.hass.name="Node Red Dashboard" \
    io.hass.description="Proxy That uses Home Assistant Ingress and Nginx to show the node red dashboard" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    org.opencontainers.image.title="Node Red Dashboard" \
    org.opencontainers.image.description="Proxy That uses Home Assistant Ingress and Nginx to show the node red dashboard" \
    org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.url="https://github.com/regevbr/addon-node-red-dashboard" \
    org.opencontainers.image.source="https://github.com/regevbr/addon-node-red-dashboard" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
