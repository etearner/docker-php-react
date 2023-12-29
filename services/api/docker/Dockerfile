FROM php:8.2-fpm-alpine

#.. System & user ..#
RUN echo 'alias ll="ls -all"' >> /etc/profile
#. Set timezone .#
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#. Accept UID and GID from build arguments.#
ARG UID=1000
ARG GID=1000
#. Create a group and user with the given UID/GID .#
RUN addgroup -g ${GID} appuser && \
    adduser -D -u ${UID} -G appuser appuser -h /home/appuser

#.. Tools ..#
#. Install PHP extensions and Xdebug .#
RUN apk add --no-cache zip libzip-dev linux-headers postgresql-dev $PHPIZE_DEPS \
    && docker-php-ext-install bcmath pdo pdo_mysql pdo_pgsql zip \
    && pecl install xdebug-3.3.1 \
    && docker-php-ext-enable xdebug \
    && apk del --purge $PHPIZE_DEPS
#. Configure Xdebug .#
RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#. Install composer .#
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

#.. Settings ..#
#. Set the default work dir .#
WORKDIR /var/www/api
#. Switch to the new user .#
USER appuser
