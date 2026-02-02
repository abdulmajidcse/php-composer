# PHP Composer

A lightweight Docker image that provides PHP CLI, Composer, and Laravel Installer pre-installed.
This image is designed for PHP developers, and Laravel projects who want a ready-to-use Composer environment without installing PHP locally.

## 🚀 Features

- PHP CLI (configurable version)

- Composer pre-installed (official binary)

- Laravel Installer globally installed (laravel new)

- Git, Zip, and libzip enabled

- Minimal and clean base image

## 🐳 Supported Use Cases

- Run Composer without installing PHP

- Create Laravel projects instantly

- Development utility container

## 📦 Run Composer in a Project

#### Note: You may use available tags like `abdulmajidcse/php-composer:tag`

```bash
docker run --rm -it \
-u "$(id -u):$(id -g)" \
-v "$(pwd):/var/www/html" \
-w /var/www/html \
abdulmajidcse/php-composer:8.5 composer install
```

- Start a terminal

```bash
docker run --rm -it \
-u "$(id -u):$(id -g)" \
-v "$(pwd):/var/www/html" \
-w /var/www/html \
abdulmajidcse/php-composer:8.5 bash
```

## 🌱 Create a New Laravel Project

```bash
docker run --rm -it \
-u "$(id -u):$(id -g)" \
-v "$(pwd):/var/www/html" \
-w /var/www/html \
abdulmajidcse/php-composer:8.5 laravel new my-laravel-app
```

## 🔍 Check Installed Versions

```bash
docker run --rm abdulmajidcse/php-composer:8.5 php -v
docker run --rm abdulmajidcse/php-composer:8.5 composer -V
docker run --rm abdulmajidcse/php-composer:8.5 laravel --version
```
