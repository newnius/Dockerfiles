FROM php:7.0-apache

MAINTAINER Newnius <docker@newnius.com>

RUN docker-php-source extract \
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-install mysqli pdo pdo_mysql \
&& a2enmod rewrite \
&& a2enmod ssl \
&& docker-php-source delete

WORKDIR /var/www/html
