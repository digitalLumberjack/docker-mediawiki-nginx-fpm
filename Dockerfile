FROM php:5.6-fpm

ENV WIKI_NAME mywiki
ENV WIKI_SERVER http://www.mywiki.com
ENV WIKI_EMAIL wiki@mywiki.com
ENV WIKI_SECRET xxxx
ENV WIKI_UPGRADE_KEY xxxx
ENV WIKI_LANG fr
ENV WIKI_ADMIN_LOGIN digital
ENV WIKI_ADMIN_PASS xxxx
ENV DB_HOST db
ENV DB_NAME wiki_db
ENV DB_USER root
ENV DB_PASS xxxx
ENV SMTP_HOST mail.mywiki.net
ENV SMTP_USER admin@mywiki.com
ENV SMTP_PASSWORD xxxx
ENV SMTP_PORT 465

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
