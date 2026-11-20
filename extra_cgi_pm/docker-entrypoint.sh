#!/bin/sh
set -e

mkdir -p /var/www/uploads
chown -R www-data:www-data /var/www/uploads
chmod 775 /var/www/uploads

exec apachectl -D FOREGROUND
