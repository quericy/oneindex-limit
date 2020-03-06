FROM richarvey/nginx-php-fpm

COPY docker-entrypoint.sh /

RUN git clone https://github.com/SomeBottle/OneIndex.git /var/www/html && \
    ssh-keygen -A

# env params
ENV REMOVE_FILES=0

# Persistent config file and cache
VOLUME [ "/var/www/html/config", "/var/www/html/cache" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]