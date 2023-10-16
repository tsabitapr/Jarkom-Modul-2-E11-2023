# SOAL 5
# simpan di bashrc
# echo nameserver 192.168.122.1 > /etc/resolv.conf
# apt-get update
# apt-get install dnsutils -y

echo '
nameserver 10.42.2.2 # IP yudhistira
' > /etc/resolv.conf

host -t PTR 10.42.2.2