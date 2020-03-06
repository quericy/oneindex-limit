FROM richarvey/nginx-php-fpm

COPY docker-entrypoint.sh /

# Persistent config file and cache
VOLUME [ "/var/www/html/config", "/var/www/html/cache" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]