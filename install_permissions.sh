echo "Creating Premission"
sudo groupadd www
sudo usermod -a -G www sreeji
sudo chown -R root:www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
