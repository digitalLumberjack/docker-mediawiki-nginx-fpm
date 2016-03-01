FROM php:5.6-fpm


RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    git

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  gd intl opcache mysqli

RUN pear install --alldeps mail 

ADD start.sh /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
