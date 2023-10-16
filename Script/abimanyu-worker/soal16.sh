# nano /etc/apache2/sites-available/parikesit.abimanyu.e11.com.conf
echo -e '
<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.e11
  ServerName parikesit.abimanyu.e11.com
  ServerAlias www.parikesit.abimanyu.e11.com

  <Directory /var/www/parikesit.abimanyu.e11/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.e11/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.e11/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.e11/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.e11/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/parikesit.abimanyu.e11.com.conf

service apache2 restart