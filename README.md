# Jarkom-Modul-2-E11-2023
Laporan resmi praktikum Jaringan Komputer modul 2 kelompok E11

| Nama | NRP |
| ------ | ------ |
| Sarah Nurhasna Khairunnisa | 5025211105 |
| Tsabita Putri Ramadhany | 5025211130 |

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
    - Pandudewanata
        ```bash
        iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.42.0.0/16
        echo nameserver 192.168.122.1 > /etc/resolv.conf
        ```
    - Node lainnya
        ```bash
        echo nameserver 192.168.122.1 > /etc/resolv.conf
        ```
- Testing ke Nakula dan Sadewa
    ```bash
    ping google.com
    ```
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/315c45fa-717c-40ba-ad88-0e92590a94bd)
    ![image](https://github.com/tsabitapr/Jarkom-Modul-2-E11-2023/assets/93377643/cee570d7-3b41-42fb-96d2-9e0eeb2b4f76)    

## NO 2
- Node Yudhistira
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
- Testing ke Nakula dan Sadewa
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

## NO 3

## NO 4

## NO 5

## NO 6

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
- Lorem ipsum
- Lorem ipsum
