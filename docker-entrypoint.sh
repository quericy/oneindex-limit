#!/bin/bash

# crontab
if [ -z $DISABLE_CRON ];then
    REFRESH_TOKEN=${REFRESH_TOKEN:-"0 * * * *"}
    REFRESH_CACHE=${REFRESH_CACHE:-"*/10 * * * *"}
    rm -rf /tmp/cron.`whoami`
    echo "${REFRESH_TOKEN} php /var/www/html/one.php token:refresh" >> /tmp/cron.`whoami`
    echo "${REFRESH_CACHE} php /var/www/html/one.php cache:refresh" >> /tmp/cron.`whoami`
    crontab -u `whoami` /tmp/cron.`whoami`
    crond
fi

# env params
GIT_REPO=${GIT_REPO:-"github.com/SomeBottle/OneIndex/"}
GIT_EMAIL=${GIT_EMAIL:-"test@test.com"}
GIT_USERNAME=${GIT_USERNAME:-"test_user"}
PHP_MEM_LIMIT=${PHP_MEM_LIMIT:-"test_user"}

bash /start.sh