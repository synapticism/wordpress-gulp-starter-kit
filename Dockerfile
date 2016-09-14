FROM wordpress:latest
RUN rm -rf /usr/local/etc/php/conf.d/opcache-recommended.ini
