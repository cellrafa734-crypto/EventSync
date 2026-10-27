# EventSync

Sistem pengelolaan event, peserta, dan jadwal berbasis frontend web dan REST API Laravel.

## Struktur
- `backend/` — aplikasi Laravel/API. File `.env` dan dependensi `vendor/` tidak disertakan.
- `frontend/` — antarmuka web.
- `diagrams/` — diagram sistem Draw.io.
- `database/eventsync_schema_sample.sql` — dump skema dan data contoh yang sudah dibersihkan dari data akun/token.

## Menjalankan secara lokal
1. Pasang PHP, Composer, MySQL, dan (bila diperlukan oleh proyek) Node.js.
2. Masuk ke folder `backend`, jalankan `composer install`.
3. Salin `.env.example` menjadi `.env`, lalu isi konfigurasi database lokal.
4. Jalankan `php artisan key:generate`.
5. Buat database `eventsync`, lalu jalankan `php artisan migrate --seed` jika seeder proyek tersedia dan sesuai.
6. Jalankan `php artisan serve`.
7. Atur URL API pada konfigurasi frontend agar menunjuk ke alamat backend lokal.

Jangan pernah mengunggah `.env`, password database, API key, token, atau data pribadi ke repositori publik.

## Penting: GitHub bukan hosting backend
Repositori GitHub menyimpan kode dan memberi tautan untuk dosen melihat source code. GitHub Pages hanya melayani situs statis; tidak menjalankan Laravel/PHP atau MySQL. Agar aplikasi interaktif bisa dipakai online dan datanya tersimpan, backend Laravel dan database harus ditempatkan di hosting yang mendukung PHP + MySQL. Database hosting perlu persisten; jangan mengandalkan penyimpanan sementara.

Dump SQL di `database/` untuk referensi/seed data demonstrasi saja. Periksa dan sesuaikan konfigurasi sebelum dipakai di hosting.
