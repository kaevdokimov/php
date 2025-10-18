# Base image arguments
ARG PHP_VERSION=8.4
ARG ALPINE_VERSION=3.22

# Build stage
FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION} AS builder

# Build arguments
ARG UID=1000
ARG GID=1001
ARG TZ=Europe/Moscow
ARG PHP_CONF_DIR=/usr/local/etc/php/conf.d

# Environment variables
ENV TZ=${TZ} \
    PHP_CONF_DIR=${PHP_CONF_DIR}

# System dependencies and PHP extensions installation
RUN apk update && apk upgrade && \
    apk add --no-cache \
        git unzip wget sudo openssh-client bash \
        icu-dev libxml2-dev gmp-dev libpng-dev libzip-dev \
        postgresql-dev rabbitmq-c-dev libssh-dev gettext-dev \
        linux-headers php84-dev autoconf gcc g++ make \
        pcre-dev zlib-dev && \
    docker-php-ext-install -j$(nproc) \
        bcmath gettext gd gmp intl opcache pcntl \
        pdo_pgsql simplexml sockets zip sysvsem && \
    docker-php-ext-enable sysvsem && \
    # Install PECL extensions with build deps
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS && \
    pecl install -o -f apcu amqp igbinary redis xdebug && \
    docker-php-ext-enable apcu amqp igbinary redis xdebug && \
    # Cleanup
    apk del .build-deps && \
    rm -rf /tmp/* /var/cache/apk/*

# Composer installation
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer clear-cache

# User configuration
RUN mkdir -p ${PHP_CONF_DIR} && \
    touch ${PHP_CONF_DIR}/custom.ini && \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    echo "date.timezone=${TZ}" > ${PHP_CONF_DIR}/custom.ini && \
    deluser www-data || true && \
    delgroup staff || true && \
    addgroup -g ${GID} staff && \
    adduser -D -u ${UID} -G staff www-data && \
    chown www-data:staff /var/www && \
    echo 'www-data ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/www-data

# Application setup
RUN mkdir -p ${PHP_CONF_DIR} && \
    touch ${PHP_CONF_DIR}/custom.ini && \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    echo "date.timezone=${TZ}" > ${PHP_CONF_DIR}/custom.ini

# Xdebug configuration for local development
RUN echo "xdebug.mode=develop,debug,coverage" >> ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini && \
    echo "xdebug.start_with_request = yes" >> ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini && \
    echo "xdebug.client_host=host.docker.internal" >> ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini && \
    echo "xdebug.log=/var/log/xdebug.log" >> ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini && \
    echo "xdebug.log_level=0" >> ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini && \
    echo "xdebug.idekey=PHPSTORM" >> ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini