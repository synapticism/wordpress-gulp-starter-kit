FROM wordpress:latest
RUN rm -rf /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN cd /tmp && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp &&\
    wp --info --allow-root
