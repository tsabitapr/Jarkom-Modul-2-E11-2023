# simpan di bashrc
# apt-get update
# apt-get install nginx -y
# apt-get install php php-fpm -y

# apt-get install wget -y
# apt-get install unzip -y

# Download dan unzip file
wget -O '/var/www/arjuna.e11.com.zip' 'https://drive.usercontent.google.com/download?id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX'
unzip -o /var/www/arjuna.e11.com.zip -d /var/www/
mv /var/www/arjuna.yyy.com /var/www/jarkom
rm -rf /var/www/arjuna.e11.com.zip

service nginx start
service nginx status
service php7.0-fpm start

# nano /etc/nginx/sites-available/jarkom
echo '
 server {

 	listen 80;

 	root /var/www/jarkom;

 	index index.php index.html index.htm index.nginx-debian.html;
 	server_name _;
 	location / {
 			try_files $uri $uri/ /index.php?$query_string;
 	}

 	# pass PHP scripts to FastCGI server
 	location ~ \.php$ {
 	        include snippets/fastcgi-php.conf;
 	        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
 	}

    location ~ /\.ht {
 			deny all;
 	}

 	error_log /var/log/nginx/jarkom_error.log;
 	access_log /var/log/nginx/jarkom_access.log;
 }
' > /etc/nginx/sites-available/jarkom

# buat symlink
ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm -rf /etc/nginx/sites-enabled/default

service nginx restart
nginx -t
