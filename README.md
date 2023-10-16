# Jarkom-Modul-2-E11-2023

Laporan resmi praktikum Jaringan Komputer modul 2 kelompok E11

| Nama                       | NRP        |
| -------------------------- | ---------- |
| Sarah Nurhasna Khairunnisa | 5025211105 |
| Tsabita Putri Ramadhany    | 5025211130 |

# Daftar Isi

- [SOAL](#soal)
- [JAWABAN](#jawaban)
  - [NO 1](#no-1)
  - [NO 2](#no-2)
  - [NO 3](#no-3)
  - [NO 4](#no-4)
  - [NO 5](#no-5)
  - [NO 6](#no-6)
  - [NO 7](#no-7)
  - [NO 8](#no-8)
  - [NO 9](#no-9)
  - [NO 10](#no-10)
  - [NO 11](#no-11)
  - [NO 12](#no-12)
  - [NO 13](#no-13)
  - [NO 14](#no-14)
  - [NO 15](#no-15)
  - [NO 16](#no-16)
  - [NO 17](#no-17)
  - [NO 18](#no-18)
  - [NO 19](#no-19)
  - [NO 20](#no-20)
- [KENDALA](#kendala)

# Soal

1. Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut
2. Buatlah website utama pada node arjuna dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.
3. Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.
4. Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.
5. Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)
6. Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.
7. Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.
8. Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.
9. Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.
10. Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh
    - Prabakusuma:8001
    - Abimanyu:8002
    - Wisanggeni:8003
11. Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy
12. Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.
13. Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy
14. Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).
15. Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.
16. Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi
    www.parikesit.abimanyu.yyy.com/js
17. Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.
18. Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.
19. Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)
20. Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

# Jawaban

## NO 1

Membuat topologi 5

![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/bfaee11b-9338-4fe5-8a54-518013d5e317)

- Buat projek baru pada GNS3
- Drag node NAT1 ke halaman
- Drag node ubuntu-1 ke halaman
- Ganti nama dan simbol ubuntu-1 menjadi router "Pandudewanata"
- Drag 3 node switch ke halaman
- Drag 8 node ubuntu-1 ke halaman
- Gantu nama dan simbol ubuntu-1 menjadi "Nakula", "Sadewa", "Yudhistira", "Werkudara", "Prabukusuma", "Abimanyu", "Wisanggeni", dan "Arjuna"
- Link setiap node sesuai dengan ketentuan topologi 5
- Setting network masing-masing node sesuai dengan prefix kelompok (10.42)

  - Pandudewanata

    ```bash
    auto eth0
    iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
        address 10.42.1.1
        netmask 255.255.255.0

    auto eth2
    iface eth2 inet static
        address 10.42.2.1
        netmask 255.255.255.0

    auto eth3
    iface eth3 inet static
        address 10.42.3.1
        netmask 255.255.255.0
    ```

  - Nakula
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.1.2
        netmask 255.255.255.0
        gateway 10.42.1.1
    ```
  - Sadewa
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.1.3
        netmask 255.255.255.0
        gateway 10.42.1.1
    ```
  - Yudhistira
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.2.2
        netmask 255.255.255.0
        gateway 10.42.2.1
    ```
  - Werkudara
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.2.3
        netmask 255.255.255.0
        gateway 10.42.2.1
    ```
  - Prabukusuma
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.3.2
        netmask 255.255.255.0
        gateway 10.42.3.1
    ```
  - Abimanyu
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.3.3
        netmask 255.255.255.0
        gateway 10.42.3.1
    ```
  - Wisanggeni
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.3.4
        netmask 255.255.255.0
        gateway 10.42.3.1
    ```
  - Arjuna
    ```bash
    auto eth0
    iface eth0 inet static
        address 10.42.3.5
        netmask 255.255.255.0
        gateway 10.42.3.1
    ```

- Configurasi masing-masing node --> `nano /root/.bashrc`

  - PANDUDEWANATA
    ```bash
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.42.0.0/16
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    ```
  - YUDHISTIRA:
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install bind9 -y
    apt-get install dnsutils -y
    apt-get install apache2 -y
    ```
  - WERKUDARA:
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install bind9 -y
    apt-get install dnsutils -y
    ```
  - NAKULA:
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install dnsutils -y
    apt-get install lynx -y
    ```
  - SADEWA:
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install dnsutils -y
    apt-get install lynx -y
    ```
  - ARJUNA:

    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install nginx -y
    ```

  - ABIMANYU:
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install nginx -y
    apt-get install php php-fpm -y
    apt-get install wget -y
    apt-get install unzip -y
    apt-get install apache2 -y
    ```
  - PRABUKUSUMA & WISANGGENI:
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    apt-get update
    apt-get install nginx -y
    apt-get install php php-fpm -y
    apt-get install wget -y
    apt-get install unzip -y
    ```

- TESTING
  ```bash
  ping google.com
  ```
  ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/315c45fa-717c-40ba-ad88-0e92590a94bd)
  ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/cee570d7-3b41-42fb-96d2-9e0eeb2b4f76)

## NO 2

- YUDHISTIRA
  - Install BIND9
    ```bash
    apt-get update
    apt-get install bind9 -y
    ```
  - Menambahkan konfigurasi untuk zona `arjuna.e11.com` ke dalam file
    ```bash
    nano /etc/bind/named.conf.local
    ```
    ```bash
    zone "arjuna.e11.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.e11.com";
    };
    ```
  - Membuat directory baru untuk menyimpan file konfigurasi zona
    ```bash
    mkdir /etc/bind/jarkom
    ```
  - Menyalin file db.local sebagai dasar untuk membuat konfigurasi zona baru
    ```bash
    cp /etc/bind/db.local /etc/bind/jarkom/arjuna.e11.com
    ```
  - Edit file zona
    ```bash
    nano /etc/bind/jarkom/arjuna.e11.com
    ```
    ```bash
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     arjuna.e11.com. root.arjuna.e11.com. (
                                2         ; Serial
                            604800         ; Refresh
                            86400         ; Retry
                            2419200         ; Expire
                            604800 )       ; Negative Cache TTL
    ;
    @       IN      NS      arjuna.e11.com.
    @       IN      A       10.42.3.5       ; IP ARJUNA
    www     IN      CNAME   arjuna.e11.com.
    @       IN      AAAA    ::1
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/b625adaa-0549-48d9-b859-fc802784d963)
  - Restart BIND9
    ```bash
    service bind9 restart
    ```
- TESTING

  - Ubah nameserver menjadi IP Yudhistira
    ```bash
    nano /etc/resolv.conf
    ```
    ```bash
    nameserver 10.42.2.2 # IP yudhistira
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d3d9f63b-6c96-40cc-8312-e2bb089aff92)
  - Test ping

    ```bash
    ping arjuna.e11.com -c 5
    host -t A arjuna.e11.com
    ping www.arjuna.e11.com
    ```

    - Nakula

      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/2375b605-ae06-4fdf-bf1c-31481594ee58)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/950c4d10-76ca-419e-ac8e-9740c0531981)

    - Sadewa

      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/32663ebe-bda3-4ddd-87c7-d4b172ac9e37)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/c633f72f-478c-4e4b-a163-81e1225e886f)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/add2e426-0a1a-4fa6-b803-29d43c93f1bf)

- SCRIPT

  - Yudhistira

    ```bash
    # Simpan di bashrc
    # echo nameserver 192.168.122.1 > /etc/resolv.conf
    # apt-get update
    # apt-get install bind9 -y

    echo '
    zone "arjuna.e11.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.e11.com";
    };
    ' > /etc/bind/named.conf.local

    mkdir /etc/bind/jarkom

    cp /etc/bind/db.local /etc/bind/jarkom/arjuna.e11.com

    echo '
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     arjuna.e11.com. root.arjuna.e11.com. (
                                  2         ; Serial
                            604800         ; Refresh
                              86400         ; Retry
                            2419200         ; Expire
                            604800 )       ; Negative Cache TTL
    ;
    @       IN      NS      arjuna.e11.com.
    @       IN      A       10.42.3.5       ; IP ARJUNA
    www     IN      CNAME   arjuna.e11.com.
    @       IN      AAAA    ::1
    ' > /etc/bind/jarkom/arjuna.e11.com

    service bind9 restart
    ```

  - Nakula dan Sadewa

    ```bash
    echo '
    nameserver 10.42.2.2 # IP yudhistira
    ' > /etc/resolv.conf

    ping arjuna.e11.com -c 5
    host -t A arjuna.e11.com
    ping www.arjuna.e11.com
    ```

## NO 3

- YUDHISTIRA
  - Menambahkan konfigurasi untuk zona `abimanyu.e11.com` ke dalam file
    ```bash
    nano /etc/bind/named.conf.local
    ```
    ```bash
    zone "abimanyu.e11.com" {
        type master;
        file "/etc/bind/jarkom/abimanyu.e11.com";
    };
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/653317ff-40a1-41e2-8861-c0e86dab2b7f)
  - Menyalin file db.local sebagai dasar untuk membuat konfigurasi zona baru
    ```bash
    cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.e11.com
    ```
  - Edit file zona
    ```bash
    nano /etc/bind/jarkom/abimanyu.e11.com
    ```
    ```bash
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                                2         ; Serial
                            604800         ; Refresh
                            86400         ; Retry
                            2419200         ; Expire
                            604800 )       ; Negative Cache TTL
    ;
    @               IN      NS      abimanyu.e11.com.
    @               IN      A       10.42.3.3       ; IP ABIMANYU
    www             IN      CNAME   abimanyu.e11.com.
    @               IN      AAAA    ::1
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d9ac4805-6c5f-4b49-b578-3455b637b659)
  - Restart BIND9
    ```bash
    service bind9 restart
    ```
- TESTING

  - Ubah nameserver menjadi IP Yudhistira
    ```bash
    nano /etc/resolv.conf
    ```
    ```bash
    nameserver 10.42.2.2 # IP yudhistira
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d3d9f63b-6c96-40cc-8312-e2bb089aff92)
  - Test ping

    ```bash
    ping abimanyu.e11.com -c 5
    host -t A abimanyu.e11.com
    ping www.abimanyu.e11.com
    ```

    - Nakula

      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d7e0daac-4797-4544-bfb6-4be1824ac7f9)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d5f19f69-ece2-49ca-a54a-41bdc8b33c4f)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/f259f9f5-c639-4ef9-9cbc-4a39da3c19ac)

    - Sadewa

      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d870635c-58cd-40b9-a1da-148b4bef03c6)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/bf4683c4-cd3e-4b68-a868-41a29bc81eb1)
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/1f3c5e1b-849b-4fb3-b297-e5acde9d775d)

- SCRIPT

  - Yudhistira

    ```bash
    echo '
    zone "arjuna.e11.com" {
      type master;
      file "/etc/bind/jarkom/arjuna.e11.com";
    };

    zone "abimanyu.e11.com" {
      type master;
      file "/etc/bind/jarkom/abimanyu.e11.com";
    };
    ' > /etc/bind/named.conf.local

    cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.e11.com

    echo '
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                                  2         ; Serial
                            604800         ; Refresh
                              86400         ; Retry
                            2419200         ; Expire
                            604800 )       ; Negative Cache TTL
    ;
    @               IN      NS      abimanyu.e11.com.
    @               IN      A       10.42.3.3       ; IP ABIMANYU
    www             IN      CNAME   abimanyu.e11.com.
    @               IN      AAAA    ::1
    ' > /etc/bind/jarkom/abimanyu.e11.com

    service bind9 restart
    ```

  - Nakula dan Sadewa
    ```bash
    ping abimanyu.e11.com -c 5
    host -t A abimanyu.e11.com
    ping www.abimanyu.e11.com
    ```

## NO 4

- YUDHISTIRA
  - Mengedit file zona `abimanyu.e11.com`
    ```bash
    nano /etc/bind/jarkom/abimanyu.e11.com
    ```
    ```bash
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                                2         ; Serial
                            604800         ; Refresh
                            86400         ; Retry
                            2419200         ; Expire
                            604800 )       ; Negative Cache TTL
    ;
    @               IN      NS      abimanyu.e11.com.
    @               IN      A       10.42.3.3       ; IP ABIMANYU
    www             IN      CNAME   abimanyu.e11.com.
    parikesit       IN      A       10.42.3.3       ; IP ABIMANYU
    @               IN      AAAA    ::1
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/7626983f-15ff-4bb2-8510-2cf2af536352)
  - Restart BIND9
    ```bash
    service bind9 restart
    ```
- TESTING

  ```bash
  ping parikesit.abimanyu.e11.com -c 5
  host -t A parikesit.abimanyu.e11.com
  ```

  - Nakula

    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/849543c8-bcb0-4d2d-8044-dbc32dc216e1)
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/231c0718-d89a-4e21-b22b-81ca2156b205)

  - Sadewa

    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/fd160e63-87e4-4e41-be93-06fd7541d9ae)
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/b304c6a6-8234-4aed-838a-c6152af6f839)

- SCRIPT

  - Yudhistira:

    ```bash
    # SOAL 4
    echo '
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                                  2         ; Serial
                            604800         ; Refresh
                              86400         ; Retry
                            2419200         ; Expire
                            604800 )       ; Negative Cache TTL
    ;
    @               IN      NS      abimanyu.e11.com.
    @               IN      A       10.42.3.3       ; IP ABIMANYU
    www             IN      CNAME   abimanyu.e11.com.
    parikesit       IN      A       10.42.3.3       ; IP ABIMANYU
    @               IN      AAAA    ::1
    ' > /etc/bind/jarkom/abimanyu.e11.com

    service bind9 restart
    ```

  - Nakula dan Sadewa:
    ```bash
    ping parikesit.abimanyu.e11.com -c 5
    host -t A parikesit.abimanyu.e11.com
    ```

## NO 5

- YUDHISTIRA
  - Menambahkan konfigurasi untuk zona reverse di file
    ```bash
    nano /etc/bind/named.conf.local
    ```
    ```bash
    zone "2.42.10.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/2.42.10.in-addr.arpa";
    };
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/f213a660-35b2-462a-82e6-f8f97806155d)
  - Menduplikasi file db.local sebagai dasar untuk membuat konfigurasi zona reverse.
    ```bash
    cp /etc/bind/db.local /etc/bind/jarkom/2.42.10.in-addr.arpa
    ```
  - Edit file zona reverse
    ```bash
    nano /etc/bind/jarkom/2.42.10.in-addr.arpa
    ```
    ```bash
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                                2         ; Serial
                            604800         ; Refresh
                            86400         ; Retry
                            2419200         ; Expire
                            604800 )        ; Negative Cache TTL
    ;
    2.42.10.in-addr.arpa.   IN      NS      abimanyu.e11.com.
    2                       IN      PTR     abimanyu.e11.com. ; byte ke4 yudhistira
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/a8422339-6486-4798-91d9-c787ecdf4aa0)
  - Restart BIND9
    ```bash
    service bind9 restart
    ```
- TESTING

  - Ubah nameserver agar sesuai dengan server DNS
    ```bash
    echo nameserver 192.168.122.1 > /etc/resolv.conf
    ```
  - Pastikan telah menginstall tools yang dibutuhkan
    ```bash
    apt-get update
    apt-get install dnsutils
    ```
  - Kembalikan nameserver agar tersambung dengan Yudhistira
    ```bash
    nano /etc/resolv.conf
    ```
    ```bash
    nameserver 10.42.2.2 # IP yudhistira
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/d3d9f63b-6c96-40cc-8312-e2bb089aff92)
  - Testing

    ```bash
    host -t PTR 10.42.2.2
    ```

    - Nakula

      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/b24d8d4d-85bd-4049-ab67-02a91d779e96)

    - Sadewa

      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/6f5db2b6-9bce-4b47-a3df-600f130574a1)

- SCRIPT

  - Yudhistira

    ```bash
    echo '
    zone "arjuna.e11.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.e11.com";
    };

    zone "abimanyu.e11.com" {
        type master;
        file "/etc/bind/jarkom/abimanyu.e11.com";
    };

    zone "2.42.10.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/2.42.10.in-addr.arpa";
    };
    ' > /etc/bind/named.conf.local

    cp /etc/bind/db.local /etc/bind/jarkom/2.42.10.in-addr.arpa

    echo '
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                                  2         ; Serial
                            604800         ; Refresh
                              86400         ; Retry
                            2419200         ; Expire
                            604800 )        ; Negative Cache TTL
    ;
    2.42.10.in-addr.arpa.   IN      NS      abimanyu.e11.com. ; reverse e byte pertama IP yudhistira
    2                       IN      PTR     abimanyu.e11.com. ; byte ke4 yudhistira
    ' > /etc/bind/jarkom/2.42.10.in-addr.arpa

    service bind9 restart
    ```

  - Nakula dan Sadewa

    ```bash
    # simpan di bashrc
    # echo nameserver 192.168.122.1 > /etc/resolv.conf
    # apt-get update
    # apt-get install dnsutils -y

    echo '
    nameserver 10.42.2.2 # IP yudhistira
    ' > /etc/resolv.conf

    host -t PTR 10.42.2.2
    ```

## NO 6

- YUDHISTIRA

  - Edit file konfigurasi DNS:
    ```bash
    nano /etc/bind/named.conf.local
    ```
    ```bash
    zone "abimanyu.e11.com" {
        type master;
        notify yes;
        also-notify { 10.42.2.3; }; // Masukan IP Werkudara
        allow-transfer { 10.42.2.3; }; // Masukan IP Werkudara
        file "/etc/bind/jarkom/abimanyu.e11.com";
    };
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/693309a3-1ba4-48e4-8700-c1835efddbc2)

- WEKUDARA
  - Update dan install BIND9:
    ```bash
    apt-get update
    apt-get install bind9 -y
    ```
  - Edit file konfigurasi DNS:
    ```bash
    nano /etc/bind/named.conf.local
    ```
    ```bash
    zone "abimanyu.e11.com" {
        type slave;
        masters { 10.42.2.2; }; // Masukan IP Yudhistira
        file "/var/lib/bind/abimanyu.e11.com";
    };
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/ebda66d7-ed98-4cfc-a60e-27f4bc1fe64f)
  - Restart BIND9 untuk menerapkan perubahan
    ```bash
    service bind9 restart
    ```
- TESTING

  - Node Yudhistira
    - Matikan BIND9 di Yudhistira untuk mensimulasikan adanya gangguan pada DNS Master
      ```bash
      service bind9 stop
      ```
  - Node Nakula dan Sadewa

    - Masukkan nameserver Werkudara
      ```bash
      nano /etc/resolv.conf
      ```
      ```bash
      nameserver 10.42.2.2 # IP YUDHISTIRA
      nameserver 10.42.2.3 # IP werkudara
      # nameserver 192.168.122.1
      ```
      ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/36c36061-2031-4d4f-a418-a8dc4785a79c)
    - Test ping

      ```bash
      ping abimanyu.e11.com -c 5
      ```

      - Nakula

        ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/6a4bf874-9203-4961-a7a1-9020b05b9f2c)

      - Sadewa

        ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/bc559fa7-ee34-46d0-9ebf-3480a1e63e40)

- SCRIPT

  - Yudhistira

    ```bash
    echo '
    zone "arjuna.e11.com" {
    type master;
    file "/etc/bind/jarkom/arjuna.e11.com";
    };

    zone "abimanyu.e11.com" {
        type master;
        notify yes;
        also-notify { 10.42.2.3; }; // Masukan IP Werkudara
        allow-transfer { 10.42.2.3; }; // Masukan IP Werkudara
        file "/etc/bind/jarkom/abimanyu.e11.com";
    };

    zone "2.42.10.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/2.42.10.in-addr.arpa";
    };
    ' > /etc/bind/named.conf.local

    service bind9 stop
    ```

  - Werkudara

    ```bash
    # simpan di bashrc
    # echo nameserver 192.168.122.1 > /etc/resolv.conf
    # apt-get update
    # apt-get install dnsutils -y

    echo '
    zone "abimanyu.e11.com" {
        type slave;
        masters { 10.42.2.2; }; // Masukan IP Yudhistira
        file "/var/lib/bind/abimanyu.e11.com";
    };
    ' > /etc/bind/named.conf.local

    service bind9 restart
    ```

  - Nakula dan Sadewa

    ```bash
    echo '
    nameserver 10.42.2.2 # IP YUDHISTIRA
    nameserver 10.42.2.3 # IP werkudara
    ' > /etc/resolv.conf

    ping abimanyu.e11.com -c 5
    ```

## NO 7

## NO 8

## NO 9

## NO 10

## NO 11

## NO 12

## NO 13

## NO 14

## NO 15

## NO 16

## NO 17

## NO 18

## NO 19

## NO 20

# Kendala

- Gagal drag ubuntu-1 yang sudah dibuat ke dalam halaman karena "docker not exist"
  - Solusi = buat hapus ubuntu-1, lalu buat ulang. Coba sampai bisa
- Tidak bisa ping website tetapi bisa ping menggunakan IP address
  - Solusi = ganti jaringan (contoh = gagal saat menggunakan wifi, maka ganti menggunakan hostpot)
- Gagal ping karena bind9 belum running
  - Solusi = cek status `service bind9 status`, kalau tidak running maka `service bind9 start`. Lalu pastikan bind9 berjalan `service bind9 status`
