FROM wordpress@sha256:a46a4a00e427168b92df0c792d0ab766bd1d4f111aaaae45fd0173ece590b6f3

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libicu-dev \
    libldap2-dev \
    ssmtp && \
    docker-php-ext-install intl && \
    docker-php-ext-enable intl && \
    docker-php-ext-install shmop && \
    docker-php-ext-enable shmop

# modify ssmtp settings
RUN sed -ri -e 's/^(mailhub=).*/\1smtp-server/' \
    -e 's/^#(FromLineOverride)/\1/' /etc/ssmtp/ssmtp.conf

COPY php.ini /usr/local/etc/php/conf.d/php.ini

RUN \
    pecl install apcu && \
    docker-php-ext-enable apcu
