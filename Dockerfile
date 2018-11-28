ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION}-slim

# Add Timezone according build args
ARG TIMEZONE
RUN set -ex \
    && export DEBIAN_FRONTEND=noninteractive \
    && echo "$TIMEZONE" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/$TIMEZONE /etc/localtime

# Install base and common packages
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
            apt-transport-https \
            apt-utils \
            ca-certificates \
            curl \
            debian-archive-keyring \
            gnupg \
    && curl -L https://packagecloud.io/github/git-lfs/gpgkey | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
            bzip2 \
            dirmngr \
            gettext-base \
            git \
            htop \
            inetutils-ping \
            iotop \
            less \
            mercurial \
            nano \
            ncdu \
            net-tools \
            netcat \
            openssh-client \
            patch \
            procps \
            rsync \
            socat \
            subversion \
            sysstat \
            tcpdump \
            telnet \
            unzip \
            wget \
            xmlstarlet \
            zip \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Install dumb-init, A minimal init system for Linux containers
# See https://engineeringblog.yelp.com/2016/01/dumb-init-an-init-for-docker.html
ENV DUMB-INIT_VERSION 1.2.2
RUN set -ex \
    && curl -Lo /tmp/pkg.deb https://github.com/Yelp/dumb-init/releases/download/v$DUMB-INIT_VERSION/dumb-init_$DUMB-INIT_VERSION_amd64.deb \
    && dpkg -i /tmp/pkg.deb && rm /tmp/pkg.deb \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Install gosu, Simple Go-based setuid+setgid+setgroups+exec
# See https://github.com/tianon/gosu
ENV GOSU_VERSION 1.10
RUN set -ex \
    && curl -Lo /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64 \
    && chmod +x /usr/local/bin/gosu

# Copy a simple wait-for script
COPY files/wait-for /usr/local/bin/
