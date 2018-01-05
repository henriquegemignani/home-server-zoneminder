FROM php:apache-stretch

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list

RUN set -eux; \
    apt-get update; \
    apt-get install  -y -q --no-install-recommends \
        ffmpeg \
        libvlc-dev  \
        libvlccore-dev\
        vlc \
        zoneminder \
    ; \
    rm -rf /tmp/* /var/tmp/*; \
    rm -rf /var/lib/apt/lists/*;

RUN a2enconf zoneminder