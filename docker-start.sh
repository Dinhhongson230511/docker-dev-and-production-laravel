#!/bin/bash
php /var/www/artisan migrate
# chmod -R 777 /var/www/public/excel
chmod -R 777 /var/www/storage/logs
chmod -R 777 /var/www/storage/app
chmod -R 777 /var/www/storage/framework
# chmod -R 777 /var/www/public/uploads/media
# php /var/www/artisan scribe:generate
# php /var/www/artisan queue:listen --timeout=0 &
# php /var/www/artisan schedule:work &
# php /var/www/artisan make-talent:init-data
php-fpm