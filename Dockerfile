FROM debian:stretch-backports

RUN set -eux; \
    apt-get update; \
    apt-get install  -y -q --no-install-recommends \
        apache2 \
        ffmpeg \
        libapache2-mod-php \
        libvlc-dev  \
        libvlccore-dev \
        vlc \
        zoneminder \
        zoneminder-doc \
    ; \
    rm -rf /tmp/* /var/tmp/*; \
    rm -rf /var/lib/apt/lists/*;

RUN a2enconf zoneminder

EXPOSE 80
CMD ["apache2-foreground"]