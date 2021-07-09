FROM php:8.0

# Copy over composer from the latest composer image so that we can create projects.
COPY --from=composer /usr/bin/composer /bin/composer

# Install just enough needed to install the simpliest of projects using composer create-project.
RUN apt-get update -y && apt-get install -y git libzip-dev zip libicu-dev && \
    docker-php-ext-configure intl && \
    docker-php-ext-install zip opcache pdo pdo_mysql mysqli intl