
# Dart Image Grabber

Aplikasi CLI sederhana berbasis Dart untuk mengunduh semua gambar dari sebuah halaman web dan menyimpannya ke folder lokal.

##  Deskripsi

Program ini akan:
1. Meminta input URL halaman web dari pengguna.
2. Meminta input folder tujuan penyimpanan gambar.
3. Mengunduh konten HTML dari URL tersebut.
4. Mengekstrak semua URL gambar dari tag `<img src="...">`.
5. Mengunduh setiap gambar dan menyimpannya ke folder tujuan.

Proyek ini dibuat sebagai bagian dari praktikum **Pemrograman Mobile - Pertemuan 04 (Topik: Pemrograman Lanjut Bahasa Dart)**.

##  Teknologi & Package

- **Dart SDK** `>=2.18.0 <4.0.0`
- [`http`](https://pub.dev/packages/http) `^0.13.6` — untuk melakukan HTTP request (unduh HTML & gambar).
- [`html`](https://pub.dev/packages/html) `^0.15.4` — untuk parsing HTML dan mengekstrak tag `<img>`.
- [`path`](https://pub.dev/packages/path) `^1.8.3` — untuk manipulasi path file (menggabungkan folder dan nama file).

##  Struktur Project

```
dart_image_grabber/
├── bin/
│   └── main.dart          # Entry point aplikasi (input pengguna & jalankan ImageGrabber)
├── lib/
│   ├── downloader.dart    # Class Downloader (fetch HTML & download gambar)
│   ├── html_parser.dart   # Class HtmlParser (ekstrak URL gambar dari HTML)
│   └── image_grabber.dart # Class ImageGrabber (orkestrasi proses unduh)
├── pubspec.yaml
└── README.md
```

##  Cara Menjalankan

1. **Clone / buka project** ini di Android Studio atau editor Dart favorit Anda.
2. **Install dependencies** dengan menjalankan perintah berikut di terminal:
   ```bash
   dart pub get
   ```
3. **Jalankan aplikasi**:
   ```bash
   dart run bin/main.dart
   ```
4. **Ikuti instruksi di terminal**, contoh:
   ```
   Selamat datang di Dart Image Grabber!
   Inputkan halaman web: http://books.toscrape.com/
   Masukkan folder tujuan: C:\coba\gambarku
   ```
5. Setelah selesai, buka folder tujuan untuk melihat hasil gambar yang telah diunduh.

##  Contoh Output

```
Selamat datang di Dart Image Grabber!
Inputkan halaman web: http://books.toscrape.com/
Masukkan folder tujuan: /Users/user/Downloads/gambarku
Mengunduh halaman...
Menemukan 20 gambar. Mengunduh...
✓ logo.png berhasil diunduh
✓ hero-logo.jpg berhasil diunduh
...
Unduhan selesai, silakan cek folder '/Users/user/Downloads/gambarku'.
```

##  Catatan Penting

- Gunakan situs yang ramah scraping untuk pengujian, seperti `http://books.toscrape.com/` (HTTP, tanpa perlindungan anti-scraping). Hindari situs HTTPS yang memiliki rantai sertifikat tidak lengkap karena dapat memicu error `HandshakeException: CERTIFICATE_VERIFY_FAILED`.

  ```dart
  class MyHttpOverrides extends HttpOverrides {
    @override
    HttpClient createHttpClient(SecurityContext? context) {
      return super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
    }
  }
  // di dalam main():
  HttpOverrides.global = MyHttpOverrides();
  ```
- Pastikan folder tujuan memiliki izin tulis (write permission).
- Nama file gambar diambil dari segmen terakhir URL (`path.basename`), sehingga jika ada beberapa gambar dengan nama sama, file akan saling menimpa.

##  Fitur yang Telah Diimplementasikan

- [x] Input URL halaman web & folder tujuan dari pengguna.
- [x] Fetch konten HTML secara asynchronous (`async/await`, `Future`).
- [x] Parsing HTML dan ekstraksi URL gambar (termasuk resolusi URL relatif terhadap base URL).
- [x] Unduh gambar dan simpan ke folder tujuan.
- [x] Pembuatan folder tujuan secara otomatis jika belum ada.
- [x] Null safety dan error handling (`try-catch`, pengecekan `null`).

##  Pengembangan Selanjutnya (Opsional)

- Filter ekstensi file (misal hanya `.jpg`, `.png`).
- Progress bar saat mengunduh banyak gambar.
- Unduhan paralel (multi-thread) menggunakan `Future.wait`.
- Penanganan nama file duplikat (misal menambahkan suffix angka).


> Topik-5: Proyek Mini - Aplikasi CLI "Dart Image Grabber
