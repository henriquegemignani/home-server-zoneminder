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

RUN chgrp -c www-data /etc/zm/zm.conf
RUN a2enmod cgi
RUN a2enmod rewrite
RUN a2enconf zoneminder

COPY container-init /usr/local/bin/

EXPOSE 80
CMD ["container-init"]
