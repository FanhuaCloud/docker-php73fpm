FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libz-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure bcmath --enable-bcmath \
    && docker-php-ext-configure exif --enable-exif\
    && docker-php-ext-configure mysqli \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure opcache \
    && docker-php-ext-install -j$(nproc) gd bcmath exif mysqli pdo_mysql zip opcache
