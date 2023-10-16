# LOAD BALANCER
# simpan di bashrc
# apt-get update
# apt-get install nginx -y

service nginx start
service nginx status

# nano /etc/nginx/sites-available/loadb-jarkom
echo 'upstream worker {
  server 10.42.3.2; # IP Prabukusuma
  server 10.42.3.3; # IP Abimanyu
  server 10.42.3.4; # IP Wisanggeni
}

server {
  listen 80;
  server_name arjuna.e11.com www.arjuna.e11.com;

  location / {
    proxy_pass http://worker;
  }
}
' > /etc/nginx/sites-available/loadb-jarkom

# simpan symlink
ln -s /etc/nginx/sites-available/loadb-jarkom /etc/nginx/sites-enabled/loadb-jarkom

rm -rf /etc/nginx/sites-enabled/default

service nginx restart
nginx -t