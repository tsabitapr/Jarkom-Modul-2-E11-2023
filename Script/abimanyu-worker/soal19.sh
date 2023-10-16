# nano /etc/apache2/sites-available/000-default.conf
echo -e '
<VirtualHost *:80>
    ServerAdmin webmaster@abimanyu.e11.com
    DocumentRoot /var/www/html

    Redirect / http://www.abimanyu.e11.com/

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/000-default.conf

apache2ctl configtest
service apache2 restart