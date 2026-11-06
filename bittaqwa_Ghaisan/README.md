# Bittaqwa

**Bittaqwa** adalah aplikasi Islami yang dikembangkan menggunakan **Flutter**. Project ini menyediakan beberapa fitur untuk membantu pengguna mengakses doa harian, melihat jadwal sholat, menonton video kajian, dan menghitung zakat.

> **Penting — ada dua bentuk Bittaqwa yang berbeda:**
> - **Flutter App (source project):** project aplikasi yang berisi kode Dart dan konfigurasi platform seperti Android dan iOS. Inilah project utama untuk pengembangan dan pembuatan aplikasi.
> - **Web Preview:** versi Flutter Web yang dijalankan melalui browser. Preview Netlify dapat dibungkus dengan frame iPhone 16 untuk keperluan demo. Frame tersebut hanya mockup tampilan website, **bukan** aplikasi iOS native atau simulator iPhone.

---

## Demo

- **Web Preview:** [Buka Bittaqwa Web Preview](https://YOUR-NETLIFY-SITE.netlify.app)
- **GitHub Repository:** [Bittaqwa](https://github.com/YOUR-USERNAME/YOUR-REPOSITORY)

> Ganti URL contoh di atas dengan link Netlify dan repository GitHub milikmu.

---

## Fitur

- **Dashboard:** halaman utama sebagai navigasi ke fitur-fitur Bittaqwa.
- **Doa-doa:** daftar kategori doa dan halaman detail doa.
- **Jadwal sholat:** menampilkan jadwal sholat menggunakan layanan data/API eksternal.
- **Video kajian:** halaman daftar video kajian YouTube dan halaman pemutar video.
- **Kalkulator zakat:** membantu menghitung estimasi zakat berdasarkan input jumlah harta.

Ketersediaan jadwal sholat dan pemutaran video membutuhkan koneksi internet. Video tertentu juga dapat tidak bisa diputar melalui embed apabila pemilik video atau YouTube membatasi pemutaran di situs lain.

---

## Flutter App vs Web Preview

| | Flutter App (aplikasi utama) | Web Preview (website/demo) |
|---|---|---|
| Bentuk | Project Flutter dengan source code Dart | Hasil build Flutter Web yang disajikan melalui browser |
| Cara dibuka | Dijalankan/build melalui Flutter pada platform yang didukung | Dibuka menggunakan link Netlify atau browser |
| Folder utama | `lib/`, `android/`, `ios/`, `pubspec.yaml`, dan folder platform lainnya | `build/web/` |
| Tujuan | Pengembangan dan pembuatan aplikasi untuk perangkat | Demo agar orang dapat mencoba Bittaqwa tanpa memasang project Flutter |
| Frame iPhone 16 | Tidak diperlukan untuk aplikasi native | Opsional; hanya mockup HTML/CSS yang membingkai Web Preview |

### 1. Flutter App — project aplikasi yang sebenarnya

Folder project Flutter berisi source code utama Bittaqwa. Kode antarmuka dan fitur ditulis dengan Dart di dalam folder `lib/`. Project juga menyertakan folder platform seperti `android/`, `ios/`, `web/`, `macos/`, `windows/`, dan `linux/`.

Folder platform tersebut adalah konfigurasi/build target Flutter. Keberhasilan menjalankan atau merilis aplikasi di tiap platform tetap bergantung pada SDK, toolchain, konfigurasi, dan pengujian platform terkait.

Contoh menjalankan aplikasi pada emulator atau perangkat yang terdeteksi Flutter:

```bash
flutter doctor
flutter pub get
flutter devices
flutter run -d <device-id>
```

Contoh membuat build Android:

```bash
flutter build apk --release
```

Contoh membuat build iOS (memerlukan macOS dan Xcode):

```bash
flutter build ios --release
```

Perintah build tidak otomatis memublikasikan aplikasi ke Google Play atau App Store. Proses signing, konfigurasi store, dan persyaratan publikasi tetap diperlukan.

### 2. Web Preview — versi yang bisa dilihat melalui website

Web Preview adalah hasil kompilasi Flutter untuk browser. Pengunjung dapat membuka link website menggunakan Chrome, Safari, atau browser modern lainnya tanpa menjalankan Flutter di komputer mereka.

Untuk membuat hasil build Web dari source project:

```bash
flutter pub get
flutter build web --release
```

Hasil build akan dibuat di:

```text
build/web/
```

**Untuk deploy Web Preview tanpa frame iPhone**, upload folder `build/web/` ke layanan hosting static seperti Netlify.

### 3. Web Preview dengan frame iPhone 16

Versi demo dengan frame iPhone 16 menggunakan halaman HTML/CSS sebagai pembungkus tampilan. Halaman tersebut menampilkan hasil Flutter Web di dalam area layar menggunakan `iframe`.

Dengan demikian:

- Aplikasi yang berjalan di dalam frame tetap merupakan **Flutter Web**.
- Frame iPhone 16 hanya elemen presentasi/mockup di website.
- Frame tersebut bukan emulator iOS, bukan perangkat iPhone sungguhan, dan bukan file aplikasi `.ipa`.
- Untuk menjalankan aplikasi native di iPhone, gunakan project Flutter dan jalankan/build melalui Xcode pada perangkat atau simulator iOS.

Jika menggunakan paket Netlify iPhone 16 yang berisi `index.html` dan folder `app/`, upload **folder terluar** yang memuat keduanya. Jangan hanya meng-upload folder `app/`.

Struktur paket preview iPhone 16:

```text
Bittaqwa_iPhone16_Netlify/
├── index.html   # Halaman mockup/frame iPhone 16
└── app/         # Hasil build Flutter Web
    ├── index.html
    ├── flutter_bootstrap.js
    ├── main.dart.js
    └── assets/
```

---

## Teknologi

- **Flutter & Dart** — framework dan bahasa pemrograman aplikasi.
- **Material Design** — komponen antarmuka Flutter.
- **HTTP** — komunikasi dengan layanan data/API jadwal sholat.
- **Intl** — pemformatan angka dan mata uang.
- **YouTube Player package** — integrasi pemutar video kajian YouTube sesuai dependency yang digunakan project.
- **Netlify** — hosting untuk Web Preview.

Versi dependency yang tepat dapat dilihat pada `pubspec.yaml` dan `pubspec.lock` di repository.

---

## Struktur Project

```text
bittaqwa_Ghaisan/
├── android/                     # Konfigurasi Android
├── ios/                         # Konfigurasi iOS
├── web/                         # Konfigurasi Flutter Web
├── macos/                       # Konfigurasi macOS
├── windows/                     # Konfigurasi Windows
├── linux/                       # Konfigurasi Linux
├── assets/
│   ├── fonts/                   # Font Poppins
│   └── image/                   # Gambar dan aset aplikasi
├── lib/
│   ├── main.dart                # Entry point aplikasi
│   ├── data/                    # Data doa
│   ├── models/                  # Model data
│   ├── presentation/
│   │   ├── screen/              # Dashboard dan layar zakat/doa
│   │   └── widget/              # Widget yang digunakan kembali
│   ├── screens/                 # Layar doa, jadwal sholat, kajian, dan detail
│   └── services/                # Service untuk mengambil data/API
├── test/                        # Unit/widget test (jika tersedia)
├── pubspec.yaml                 # Konfigurasi project dan dependencies
└── README.md
```

---

## Menjalankan Project di Lokal

### Persyaratan

- Flutter SDK yang sesuai dengan batas versi pada `pubspec.yaml`.
- Dart SDK yang disertakan dengan Flutter.
- Visual Studio Code atau Android Studio (opsional, sebagai editor).
- Android SDK untuk menjalankan/build Android.
- Xcode untuk menjalankan/build iOS di macOS.

Periksa instalasi Flutter:

```bash
flutter --version
flutter doctor
```

### Instalasi

Clone repository:

```bash
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
cd YOUR-REPOSITORY
```

Ambil dependencies:

```bash
flutter pub get
```

Jalankan di Chrome:

```bash
flutter run -d chrome
```

Jalankan di emulator/perangkat yang terdeteksi:

```bash
flutter devices
flutter run -d <device-id>
```

---

## Deployment ke Netlify

### A. Deploy Web Preview biasa

1. Build Flutter Web:

   ```bash
   flutter build web --release
   ```

2. Buka folder `build/web/`.
3. Upload folder `build/web/` ke Netlify Drop atau atur folder tersebut sebagai **publish directory** pada konfigurasi Netlify.
4. Buka URL deployment untuk mencoba Bittaqwa melalui browser.

### B. Deploy Web Preview dengan frame iPhone 16

1. Gunakan paket preview iPhone 16 yang berisi `index.html` dan folder `app/`.
2. Extract ZIP paket tersebut.
3. Pastikan `index.html` dan folder `app/` berada di dalam folder yang sama.
4. Upload folder terluar tersebut ke Netlify.
5. Buka URL deployment. Halaman utama akan menampilkan Flutter Web di dalam mockup iPhone 16.

> Bila source code Flutter diperbarui, build ulang Web dan perbarui isi folder `app/` pada paket preview. Pertahankan `index.html` pembungkus iPhone 16.

---

## Catatan

- Web Preview adalah cara untuk mencoba versi browser dari Bittaqwa; tampilannya dapat berbeda dari aplikasi native pada perangkat.
- Frame iPhone 16 hanya mockup presentasi, bukan bukti bahwa aplikasi telah dijalankan pada iPhone asli.
- Fitur yang membutuhkan internet tidak akan bekerja dengan benar saat perangkat offline.
- Pastikan API key, token, password, dan secret lainnya tidak dimasukkan ke repository publik. Gunakan environment variable atau konfigurasi secret pada layanan hosting bila diperlukan.
- Periksa kembali ketentuan penggunaan dan pembatasan embed untuk setiap video YouTube.
- Perhitungan zakat dalam aplikasi merupakan alat bantu estimasi. Verifikasi nisab dan ketentuan zakat dengan sumber resmi atau pihak yang kompeten.

---

## Kontribusi

Saran, laporan bug, dan pengembangan fitur dapat disampaikan melalui GitHub Issues atau Pull Request.

Sebelum mengirim perubahan, jalankan pemeriksaan dasar:

```bash
flutter pub get
flutter analyze
flutter test
```

---

## Lisensi

Lisensi project belum ditentukan. Jangan menganggap source code ini bebas digunakan ulang atau didistribusikan sebelum pemilik project menambahkan file `LICENSE` dan menetapkan ketentuannya.

---

**Built with Flutter for Bittaqwa.**