# download dan unzip file
wget -O '/var/www/rjp.baratayuda.abimanyu.e11.com.zip' 'https://drive.usercontent.google.com/download?id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6'
unzip -o /var/www/rjp.baratayuda.abimanyu.e11.com.zip -d /var/www/
mv /var/www/rjp.baratayuda.abimanyu.yyy.com /var/www/rjp.baratayuda.abimanyu.e11
rm -rf /var/www/rjp.baratayuda.abimanyu.e11.com.zip

# nano /etc/apache2/sites-available/rjp.baratayuda.abimanyu.e11.com.conf
echo -e '
<VirtualHost *:14000 *:14400>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/rjp.baratayuda.abimanyu.e11

	ServerName rjp.baratayuda.abimanyu.e11.com
	ServerAlias www.rjp.baratayuda.abimanyu.e11.com

	ErrorDocument 404 /error/404.html
    ErrorDocument 403 /error/403.html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.e11.com.conf

# nano /etc/apache2/ports.conf
# tambahin listen 14000 dan 14400
echo -e '
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 14000
Listen 14400

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
' > /etc/apache2/ports.conf

a2ensite rjp.baratayuda.abimanyu.e11.com.conf

service apache2 restart