FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
        libz-dev \
        libwebp-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
    && docker-php-ext-configure gd --with-webp-dir=/usr/include/webp --with-jpeg-dir=/usr/include --with-png-dir=/usr/include --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-configure bcmath --enable-bcmath \
    && docker-php-ext-configure exif --enable-exif \
    && docker-php-ext-configure mysqli \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure opcache \
    && docker-php-ext-install -j$(nproc) gd bcmath exif mysqli pdo_mysql zip opcache
