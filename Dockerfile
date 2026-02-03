# Build args
ARG PHP_VERSION=8.5
ARG COMPOSER_VERSION=latest

# Composer stage
FROM composer:${COMPOSER_VERSION} AS composer

# PHP runtime stage
FROM php:${PHP_VERSION}-cli

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    zip \
    libzip-dev \
    ca-certificates \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user matching common host UID/GID (1000)
RUN groupadd -g 1000 hello \
    && useradd -u 1000 -g 1000 -m hello

# Copy Composer binary
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# Set HOME explicitly (important for composer global)
ENV HOME=/home/hello
ENV COMPOSER_HOME=/home/hello/.composer
ENV PATH="/home/hello/.composer/vendor/bin:${PATH}"

# Switch user
USER hello
WORKDIR /var/www/html

# Install Laravel installer globally
RUN composer global require laravel/installer \
    && composer clear-cache
