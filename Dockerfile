FROM php:8.1-fpm-alpine

# Set working directory
ARG workdir=/var/www

WORKDIR $workdir

# Install system dependencies
RUN apk update
RUN apk add --no-cache \
libjpeg-turbo-dev \
libpng-dev \
libwebp-dev \
freetype-dev \
libzip-dev \
zip \
bash \
dos2unix

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql 
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install exif
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd

COPY . .

# Get latest Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

#syns php.init for dev
COPY ./docker/php/php.ini-development /usr/local/etc/php/php.ini

#sync php.init for production
#COPY ./docker/php/php.ini-production /usr/local/etc/php/php.ini

# run for production
#RUN cd /var/www && cp .env.example .env
#RUN cd /var/www && composer install --ignore-platform-reqs --no-scripts 
#RUN cd /var/www && php artisan key:generate
#COPY docker-start.sh /var/www/docker-start.sh
#RUN chmod +x /var/www/docker-start.sh

# run for test without nginx
#RUN composer install
#CMD php artisan serve --host=0.0.0.0 --port=8080
#EXPOSE 8000

CMD ["php-fpm"]