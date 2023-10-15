# Jarkom-Modul-1-E11-2023
Laporan resmi praktikum Jaringan Komputer modul 1 kelompok E11

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
 - [KENDALA](#kendala)
  
# Soal

1. User melakukan berbagai aktivitas dengan menggunakan protokol FTP. Salah satunya adalah mengunggah suatu file.
    a. Berapakah sequence number (raw) pada packet yang menunjukkan aktivitas tersebut? 
    b. Berapakah acknowledge number (raw) pada packet yang menunjukkan aktivitas tersebut? 
    c. Berapakah sequence number (raw) pada packet yang menunjukkan response dari aktivitas tersebut?
    d. Berapakah acknowledge number (raw) pada packet yang menunjukkan response dari aktivitas tersebut?
2. Sebutkan web server yang digunakan pada portal praktikum Jaringan Komputer!
3. Dapin sedang belajar analisis jaringan. Bantulah Dapin untuk mengerjakan soal berikut:
    a. Berapa banyak paket yang tercapture dengan IP source maupun destination address adalah 239.255.255.250 dengan port 3702?
    b. Protokol layer transport apa yang digunakan?
4. Berapa nilai checksum yang didapat dari header pada paket nomor 130?
5. Elshe menemukan suatu file packet capture yang menarik. Bantulah Elshe untuk menganalisis file packet capture tersebut.
    a. Berapa banyak packet yang berhasil di capture dari file pcap tersebut?
    b. Port berapakah pada server yang digunakan untuk service SMTP?
    c. Dari semua alamat IP yang tercapture, IP berapakah yang merupakan public IP?

    **Soal 6-7 menggunakan file pcap yang sama.**

6. Seorang anak bernama Udin Berteman dengan SlameT yang merupakan seorang penggemar film detektif. sebagai teman yang baik, Ia selalu mengajak slamet untuk bermain valoranT bersama. suatu malam, terjadi sebuah hal yang tak terdUga. ketika udin mereka membuka game tersebut, laptop udin menunjukkan sebuah field text dan Sebuah kode Invalid bertuliskan "server SOURCE ADDRESS 7812 is invalid". ketika ditelusuri di google, hasil pencarian hanya menampilkan a1 e5 u21. jiwa detektif slamet pun bergejolak. bantulah udin dan slamet untuk menemukan solusi kode error tersebut.
7. Berapa jumlah packet yang menuju IP 184.87.193.88?
8. Berikan kueri filter sehingga wireshark hanya mengambil semua protokol paket yang menuju port 80! (Jika terdapat lebih dari 1 port, maka urutkan sesuai dengan abjad)
9. Berikan kueri filter sehingga wireshark hanya mengambil paket yang berasal dari alamat 10.51.40.1 tetapi tidak menuju ke alamat 10.39.55.34!
10. Sebutkan kredensial yang benar ketika user mencoba login menggunakan Telnet

# Jawaban
## NO 1
   - **Soal nomor 1a dan 1b**.
        <br>
        Karena command untuk mengunggah file ke server FTP adalah “STOR”, maka display filter ftp yang memiliki command “STOR” yaitu dengan command ftp contains “STOR”. Lalu lihat pada bagian Transmission Control Protocol (TCP) untuk mendapatkan sequence number(raw) dan acknowledge number (raw)
        ![JARKOM NO 1A](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/906ce455-1c34-47ec-b017-d69c4c22e305)
        Dengan demikian, didapatkan jawaban untuk soal nomor 1a adalah **258040667** dan 1b adalah **1044861039**.

- **Soal nomor 1c dan 1d**. 
        <br>
        Karena kita sudah mengetahui nama file yang diupload berdasarkan soal nomor 1a dan 1b, yaitu **c75-GrabThePhisher.zip**, maka untuk melihat response dari aktivitas unggah file tadi lakukan display filter untuk mencari nama file yang sama seperti yang diunggah yaitu menggunakan command `tcp contains "c75-GrabThePhisher.zip"` dan melihat pada bagian **“Response”**. Lihat pada bagian Transmission Control Protocol (TCP) untuk mendapatkan sequence number(raw) dan acknowledge number (raw).
        ![JARKOM NO 1C 1D](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/a15a74bf-b94c-4d6a-8d6a-e62bb956c784)
        Dengan demikian didapatkan jawaban untuk soal nomor 1c adalah **1044861039** dan 1d adalah **258040696**.
    - Flag:
        ![NC NO 1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/80d386cd-fa9a-4d66-ae9b-8701884ba259)

## NO 2
2. Menggunakan display filter **http contains “web”** pada display filter wireshark
   ![1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/7e83287b-c57c-4df7-a864-c55040bc37d4)

   Memilih salah satu paket lalu follow UTP Stream. Didapatkan hasil **Server: gunicorn**
   ![2](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/f3c0c6f2-b85e-41bd-b246-a5e19f41a5ed)
   ![3](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/77332553-3fe3-4dd8-b947-8487e01255fa)

- Flag:
  ![4](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/5673442b-f55b-4435-b056-59cbb71a1506)


## NO 3
3.a. 
    Untuk mengihitung jumlah paket dengan filter tententu dapat dilakukan dengan menuju **menu statitics --> IPv4 Statistics --> All Addresses** seperti gambar di bawah.
   
![NO 3 A_1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/c3002861-c55d-46f1-ada8-5460be5e6b9e)

Kemudian gunakan display filter **ip.addr == 239.255.255.250 && udp.port == 3702** pada display filter wireshark untuk mengambil paket yang tercapture dengan IP source maupun destination address adalah 239.255.255.250 dengan port 3702.
    ![NO 3A_2](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/2c25497c-3507-4e5c-8df6-697ce5c9793b)

   **Jadi, total ada 21 packet.**

3.b. 
    Bisa dilihat pada bagian kolom protocol berdasarkan filter di nomor 3a, yang digunakan adalah **UDP**.
    ![NO 3 B](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/73687327-3d05-45e0-8a5f-3ed23022d164)
- Flag:
    ![NC NO 3](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/f5014b73-3482-474c-9401-df20d73fc746)

## NO 4
4. Mencari paket nomor 130 menggunakan display filter **frame.number == 130**
   
   Cek User Diagram Protokol (UDP) dan ditemukan bahwa **Checksum: 0x18e5 [unverified]**
   ![NO 4](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/68067ed2-4ce1-476b-913e-6be6be7fc726)

- Flag:

  ![NC NO 4](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/56716c07-4227-4ae4-8de5-42e113708848)

## NO 5
5. - Sebelum mengerjakan soalnya, kita perlu mencari tahu nc nya terlebih dahulu, yaitu dengan mengecek pada file pcap. Pada packet no 14 terdapat info mengenai “pass”.
    ![NO 5_PASS 1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/9bba1ffa-1a0c-460d-8090-f3f7465fcf1b)

    - Setelah itu **klik kanan→follow→TCP Stream**. Scroll ke bawah, dan terdapat informasi mengenai password pada file zip yaitu seperti pada gambar di bawah.
      
        ![NO 5 PASS](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/d4f6ccaf-9f78-41e5-a90f-3869609d918c)

    - Dengan demikian, diketahui passwordnya adalah **NWltcGxlUGFzNXdvcmQ=** dan harus di decode dengan Base64 sehingga passwordnya adalah **5implePas5word**.
      
        ![NO 5 DECRYPT](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/21a0706a-e48c-4b94-9166-8ced10d04f92)
    - Masukkan password ke dalam file zip untuk mendapatkan nc nya.
    ![NO 5_UNZIP 1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/84d33d7f-21d2-434b-a4ee-5e13cf3c78c2)
    ![NO 5_NC](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/34072b3b-7859-4601-9b26-8854d6129bca)

    Dengan demikian, didapatkan **nc 10.21.78.111 11111**

   a. Banyak packet yang berhasil di capture dari file pcap tersebut ada sebanyak **60 packet**. Dapat dilihat dengan menuju **menu statitics --> IPv4 Statistics --> All Addresses** dan lihat pada bagian count seperti pada gambar berikut.
        ![NO 5 A](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/1d3eef43-1d62-4b20-b61d-c8ae40075602)

   b. Port yang digunakan pada server yang digunakan untuk service SMTP adalah **25**.\
        ![NO 5 B](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/1ebed8c1-c4a6-4c45-b13b-9d111b32d6e7)

   c. Dari semua alamat IP yang tercapture, IP yang merupakan public IP adalah **74.53.140.153**. 
        
   Ada 3 jenis IP yang diketahui yaitu 10.10.1.4, 192.168.1.1, dan 74.53.140.153. private IP umumnya diawali dengan 10.XX.X.X, 10.x.x.x, 172.16.x.x - 172.31.x.x, atau 192.168.x.x. dan public IP cenderung lebih unik daripada private IP sehingga yang merupakan public IP adalah 74.53.140.153.

- Flag
  ![image](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/2a1ba031-8397-478c-8493-d278c755681b)

## NO 6
6. - Jika dilihat pada soal, ada kejanggalan pada huruf besar di beberapa kata, yaitu:
        - **S**eorang
        - **U**din
        - **B**erteman
        - **S**lamet
        - **T**eman
        - **I**a
        - **T**erjadi
        - **U**din
        - **S**ebuah
        - **I**nvalid
	- Jika diambil huruf kapitalnya saja maka terdapat hint **SUBSTITUSI**
    - Kemudian pada kalimat “hasil pencarian hanya menampilkan a1 e5 u21”. Jika dilihat pada bagian “a1 e5 u21”,  ini merupakan enkripsi huruf-angka, yaitu
        - a = 1
        - e = 5
        - u = 21

    - Berdasarkan pernyataan "server SOURCE ADDRESS 7812 is invalid", cari packet nomor **7812** dengan display filter **frame.number == 7812** dan jika diperhatikan, tulisan source address ditulis capslock sehingga catat IP source address pada packet nomor 7812, yaitu **104.18.14.101**.
      
        ![NO 6_1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/6ea12aca-0d6b-40e0-adb3-dd3ca218c381)
    - Coba lakukan substitusi/enkripsi IP source addressnya menggunakan hint pada nomor **“b”** (enkripsi: a1 e5 u21). Karena alphabet hanya sampai 26, pisah angka pada IP agar masuk dalam range alphabet, yaitu
         > 10-4-18-14-10-1

        dekripsi: 
        - huruf ke-10 = J 
        - huruf ke-4 = D
        - huruf ke-18 = R
        - huruf ke-14 = N
        - huruf ke-10 = J
        - huruf ke-1 = A
        
        sehingga jawabannya adalah **JDRNJA**

    - Flag
      
        ![NC 6](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/d912f4bb-feda-40c0-b86f-b260bc242206)
      
## NO 7
7. Gunakan display filter **ip.dst == 184.87.193.88** pada display filter wireshark, dan hitung banyak packetnya. Total packet: 6. Atau dapat menggunakan **menu statitics --> IPv4 Statistics --> All Addresses** lalu filter dengan menggunakan command yang sama.
    ![NO 7](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/23db6db8-c4a7-4972-bde9-47110bf35159)
 - Flag
   
    ![NC NO 7](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/ea89c2d8-f96a-4363-b3cc-4f4d1f88a978)

## NO 8
8. Filtering wireshark menggunakan qualifier tcp dan udp yang digunakan untuk menentukan protokol dari id. Lalu menggunakan operator or (||) untuk menghubungkan 2 primitive dalam 1 sintaks.
   ![2](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/0bff33b9-463e-4129-9024-edd2e684d5c6)
   
   Menggunakan display filter **tcp.dstport == 80 || udp.dstport == 80**
   ![1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/81ef9a24-b57d-482f-97ca-728333af10ff)

- Flag
  ![3](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/604d121f-2a2d-4f95-9a9b-a00e462899ee)
  
## NO 9
9. Gunakan display capture **ip.src == 10.51.40.1 && ip.dst != 10.39.55.34** sehingga wireshark hanya mengambil paket yang berasal dari alamat 10.51.40.1 tetapi tidak menuju ke alamat 10.39.55.34.
    
    ![NO 9](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/ec591521-32a3-4f13-90ac-23d71de8abd0)
- Flag
  
    ![NC NO 9](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/114993457/dcb37c8c-8860-4d0b-bb7d-494599730621)

## NO 10
10. Menggunakan display filter **telnet** pada wireshark
    ![1](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/12d4dac1-731d-4595-964f-7356d8345858)
    
    Follow satu per satu paket sampai menemui adanya username dan password
    - Misal pada paket ke 77. Terlihat tidak ada username dan password, berarti bukan kredensial yang benar
      ![2](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/7910bfa0-5094-4151-9c16-26c7a6ca75fd)
    - Misal pada paket ke 197. Masih tidak terlihat adanya username dan password
      ![3](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/a2b3754a-b822-4121-959e-f782bc7a09fc)
    - Misal pada paket ke 227. Terlihat ada username dan password (kredensial)
      ![4](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/de5f9c2c-259a-4419-97a8-5c2ce02053d9)
   
    Memasukkan jawaban username dan password dengan melakukan penghapusan karakter pada username **ddhhaaffiinn** menjadi **dhafin**
    
- Flag
  ![image](https://github.com/tsabitapr/Jarkom-Modul-1-E11-2023/assets/93377643/ec2f38cb-b3e2-4a61-9a77-9ecb0b4f6c6a)

# Kendala
- Pada saat praktikum belum bisa menemukan penyelesaian untuk soal nomor 6
- Kendala jaringan yang sangat jelek karena VPN sehingga lama ketika ingin mengunduh file
- Berkali-kali salah menjawab karena penulisan yang salah pada soal nomor 8 **(or menjadi ||)**
- Salah menjawab nomor 10 karena username belum dilakukan penghapusan karakter **(ddhhaaffiinn menjadi dhafin)**
