ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:10.1.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
        g++=10.3.1_git20210424-r2 \
        gcc=10.3.1_git20210424-r2 \
        libc-dev=0.7.2-r3 \
        linux-headers=5.10.41-r0 \
        make=4.3-r0 \
    \
    && apk add --no-cache \
        nginx=1.20.2-r0 \
        openssh-client=8.6_p1-r3 \
        patch=2.7.6-r7 \
        python3=3.9.5-r2 \
    \
    && echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
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
    io.hass.name="Node-Red Dashboard" \
    io.hass.description="Gain access to the Node-RED dashboard from HA side menu" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    org.opencontainers.image.title="Node-Red Dashboard" \
    org.opencontainers.image.description="Gain access to the Node-RED dashboard from HA side menu" \
    org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.url="https://github.com/regevbr/addon-node-red-dashboard" \
    org.opencontainers.image.source="https://github.com/regevbr/addon-node-red-dashboard" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
