# download dan unzip file
wget -O '/var/www/parikesit.abimanyu.e11.com.zip' 'https://drive.usercontent.google.com/download?id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS'
unzip -o /var/www/parikesit.abimanyu.e11.com.zip -d /var/www/
mv /var/www/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.e11
rm -rf /var/www/parikesit.abimanyu.e11.com.zip

# nano /etc/apache2/sites-available/parikesit.abimanyu.e11.com.conf
echo -e '
<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.e11

  ServerName parikesit.abimanyu.e11.com
  ServerAlias www.parikesit.abimanyu.e11.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/parikesit.abimanyu.e11.com.conf

a2ensite parikesit.abimanyu.e11.com.conf

service apache2 restart