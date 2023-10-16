# simpan di bashrc
# apt-get update
# apt-get install apache2 -y
# apt-get install php -y

# download dan unzip file
wget -O '/var/www/abimanyu.e11.com.zip' 'https://drive.usercontent.google.com/download?id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc'
unzip -o /var/www/abimanyu.e11.com.zip -d /var/www/
mv /var/www/abimanyu.yyy.com /var/www/abimanyu.e11
rm -rf /var/www/abimanyu.e11.com.zip

service apache2 start
service php7.0-fpm start

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/abimanyu.e11.com.conf

rm /etc/apache2/sites-available/000-default.conf

# TARO FILE PHP NYA DI DALEM /var/www/abimanyu.e11.com
# mkdir -p /var/www/abimanyu.e11
# cp /root/jawaban/index11.php /var/www/abimanyu.e11/index.php
# cp /root/jawaban/home.html /var/www/abimanyu.e11

# nano /etc/apache2/sites-available/abimanyu.e11.com.conf
echo -e '
<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.e11

  ServerName abimanyu.e11.com
  ServerAlias www.abimanyu.e11.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/abimanyu.e11.com.conf

a2ensite abimanyu.e11.com.conf

service apache2 restart