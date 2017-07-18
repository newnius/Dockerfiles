FROM php:5.6-apache

MAINTAINER Newnius <docker@newnius.com>

RUN docker-php-source extract \
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-install mysqli pdo pdo_mysql \
&& a2enmod rewrite \
&& a2enmod ssl \
&& docker-php-source delete

ADD php.ini /usr/local/etc/php/

ADD apache2.conf /etc/apache2/

ADD security.conf /etc/apache2/conf-available/

WORKDIR /var/www/html
