FROM php:7.3-fpm-alpine

MAINTAINER Newnius <docker@newnius.com>

RUN docker-php-source extract \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-source delete

WORKDIR /var/www/html
