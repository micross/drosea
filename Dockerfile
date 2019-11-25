FROM alpine

LABEL maintainer="panwei <546196895@qq.com>" version="1.0" license="MIT"

RUN apk add \
php7-openssl \
php7-sqlite3 \
php7-pear \
php7-gmp \
php7-pdo_mysql \
php7-pcntl \
php7-redis \
php7-mbstring \
php7-timezonedb \
php7-xmlreader \
php7-pdo_sqlite \
php7-exif \
php7-opcache \
php7-session \
php7-gettext \
php7-json \
php7-xml \
php7 \
php7-iconv \
php7-sysvshm \
php7-curl \
php7-phar \
php7-zip \
php7-cgi \
php7-ctype \
php7-mcrypt \
php7-bcmath \
php7-calendar \
php7-tidy \
php7-dom \
php7-sockets \
php7-memcached \
php7-sysvmsg \
php7-zlib \
php7-sysvsem \
php7-pdo \
php7-bz2 \
php7-gd \
php7-mysqli \
php7-fileinfo \
composer

#composer curl openssl tar autoconf build-base linux-headers libaio-dev openssl-dev

# RUN printf "yes\nyes\n" | pecl install swoole

RUN { \
        echo "upload_max_filesize=100M"; \
        echo "post_max_size=108M"; \
        echo "memory_limit=1024M"; \
        echo "date.timezone=Asia/Shanghai"; \
    } | tee /etc/php7/php.ini \
    && apk del libaio-dev php7-dev autoconf build-base linux-headers \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"

#COPY . /opt/www

WORKDIR /opt/www

#RUN composer install --no-dev && composer dump-autoload -o

EXPOSE 8000

ENTRYPOINT ["php", "/opt/www/think", "run"]