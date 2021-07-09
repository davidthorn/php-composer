FROM php:8.0

COPY --from=composer /usr/bin/composer /bin/composer

RUN apt-get update -y && apt-get install -y git libzip-dev zip libicu-dev && \
    docker-php-ext-configure intl && \
    docker-php-ext-install zip opcache pdo pdo_mysql mysqli intl