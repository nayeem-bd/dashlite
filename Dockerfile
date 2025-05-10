FROM php:8.3-fpm

# Install OS packages
RUN apt-get update && apt-get install -y \
    build-essential \
    mariadb-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    nano \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev \
    libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Install Redis extension
RUN pecl install redis && docker-php-ext-enable redis

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www

# Copy full source code first
COPY . /var/www

# Set permissions
RUN groupadd -g 1000 www && \
    useradd -u 1000 -ms /bin/bash -g www www && \
    chown -R www:www /var/www

# Install Laravel dependencies
RUN composer install --no-dev --optimize-autoloader

USER www

EXPOSE 9000
CMD ["php-fpm"]
