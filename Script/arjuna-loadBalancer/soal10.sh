# LOAD BALANCER
service nginx start

echo 'upstream worker {
  server 10.42.3.2:8001; # IP Prabukusuma
  server 10.42.3.3:8002; # IP Abimanyu
  server 10.42.3.4:8003; # IP Wisanggeni
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