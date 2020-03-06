FROM richarvey/nginx-php-fpm

COPY docker-entrypoint.sh /

# env params
ENV GIT_REPO=github.com/SomeBottle/OneIndex/
ENV GIT_EMAIL=git@test.com
ENV GIT_USERNAME=git_user

# Persistent config file and cache
VOLUME [ "/var/www/html/config", "/var/www/html/cache" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]