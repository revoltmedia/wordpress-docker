FROM php:7-fpm

RUN apt-get update -y && apt-get install -y sendmail libpng-dev libmagickwand-dev imagemagick

RUN docker-php-ext-install mysqli \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /tmp/wp-cli.phar \
  && chmod +x /tmp/wp-cli.phar \
  && mv /tmp/wp-cli.phar /usr/local/bin/wp
