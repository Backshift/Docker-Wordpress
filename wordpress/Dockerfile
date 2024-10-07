# Use an official PHP runtime as a parent image
FROM php:8.0-apache

RUN apt-get update
# Install necessary PHP extensions and utilities
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip # \
    # && docker-php-ext-configure gd --with-freetype --with-jpeg \
    # && docker-php-ext-install -j$(nproc) gd mbstring xml mysqli pdo pdo_mysql

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd mbstring xml mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set up the document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/app

# Create necessary directories
RUN mkdir -p /var/www/html/app

# Change ownership of the extracted files
RUN chown -R www-data:www-data /var/www/html/app

# Expose port 80
EXPOSE 80

# Copy custom Apache configuration file
COPY ../config/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Restart Apache
CMD ["apache2-foreground"]