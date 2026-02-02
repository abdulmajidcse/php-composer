# Build args
ARG PHP_VERSION=8.5
ARG COMPOSER_VERSION=latest

FROM composer:${COMPOSER_VERSION} AS composer
FROM php:${PHP_VERSION}-cli

# System dependencies
RUN apt-get update && apt-get install -y \
    git unzip zip libzip-dev \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install Laravel installer globally
RUN composer global require laravel/installer

# Composer global bin path
ENV COMPOSER_GLOBAL_PATH=/root/.composer/vendor/bin
ENV PATH="$COMPOSER_GLOBAL_PATH:$PATH"