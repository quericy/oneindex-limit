#!/bin/bash

# timezone
ln -sf /usr/share/zoneinfo/${TZ:-"Asia/Shanghai"} /etc/localtime
echo ${TZ:-"Asia/Shanghai"} > /etc/timezone

# crontab
if [ -z $DISABLE_CRON ];then
    REFRESH_TOKEN=${REFRESH_TOKEN:-"0/60 * * * *"}
    REFRESH_CACHE=${REFRESH_CACHE:-"*/30 * * * *"}
    rm -rf /tmp/cron.`whoami`
    echo "${REFRESH_TOKEN} php /var/www/html/one.php token:refresh" >> /tmp/cron.`whoami`
    echo "${REFRESH_CACHE} php /var/www/html/one.php cache:refresh" >> /tmp/cron.`whoami`
    crontab -u `whoami` /tmp/cron.`whoami`
    crond
fi

# add write permission
chmod -R 765 /var/www/html/cache /var/www/html/config

# mock media ext rule
sed -i 's#jpg|jpeg|gif|png|css|js|ico|webp|tiff|ttf|svg#xxx1xxx#g' /etc/nginx/sites-available/default.conf

bash /start.sh