# Base Image Use the basic image of php7.2 included with the apache web server 
FROM php:7.2-apache 
# Update local package 
RUN apt-get update 
# Install PHP extension mysqli 
RUN docker-php-ext-install mysqli 
# Copy files Tasks in the current folder into the container 
ADD ./eatancedelivery /var/www/html 
# Change the permissions in the directory /var/www/html to www-data (PHP) 
RUN chown -R www-data:www-data /var/www/html 
#, set the rights to only the user www-data (PHP) accessible. 
RUN chmod 700 /var/www/html/.

RUN a2enmod rewrite

# Install xdebug
#RUN pecl install xdebug && \
#  docker-php-ext-enable xdebug





EXPOSE 8828

CMD [ "php", "-S", "0.0.0.0:8828" ]

