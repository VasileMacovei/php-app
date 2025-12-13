FROM php:8.3-apache

WORKDIR /var/www/html

COPY . .

RUN apt-get update && apt-get install -y unzip \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer install

EXPOSE 80
