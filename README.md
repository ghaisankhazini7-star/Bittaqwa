Bittaqwa
Aplikasi Islami berbasis Flutter yang membantu pengguna mengakses doa harian, jadwal sholat, video kajian, dan kalkulator zakat dalam satu aplikasi.
Live Demo: Tambahkan URL Netlify Bittaqwa di sini setelah deployment selesai.

Fitur
- Dashboard — halaman utama dengan sapaan dan ilustrasi header yang menyesuaikan waktu.
- Doa-doa harian — kumpulan doa berdasarkan kategori, seperti pagi dan malam, rumah, makanan dan minuman, perjalanan, sholat, serta etika baik. Detail doa menampilkan teks Arab, terjemahan, dan referensi yang tersedia.
- Jadwal sholat — mengambil jadwal melalui API eQuran. Project saat ini menggunakan konfigurasi awal Jonggol, Kabupaten Bogor, dan menyediakan data fallback ketika permintaan API gagal atau perangkat offline.
- Video kajian — daftar video kajian YouTube beserta thumbnail, judul, ustadz, channel, dan deskripsi.
- Kalkulator zakat — membantu menghitung estimasi zakat harta berdasarkan persentase 2,5% dan ambang harta yang dikonfigurasi di dalam kode.
Teknologi
- Flutter dan Dart
- Material Design 3
- http untuk komunikasi dengan API jadwal sholat
- intl untuk format tanggal dan mata uang
- Package pemutar YouTube yang tercantum di pubspec.yaml
- Font Poppins dan aset gambar lokal
Menjalankan Project
Prasyarat
Pastikan Flutter SDK dan Dart SDK sudah terpasang. Versi Dart yang dibutuhkan mengikuti batasan environment di pubspec.yaml.

Periksa instalasi Flutter:
flutter doctor
Instalasi dependency
Clone repository, lalu masuk ke folder project yang berisi pubspec.yaml:
git clone https://github.com/USERNAME/Bittaqwa.git
cd Bittaqwa
flutter pub get
Ganti USERNAME dengan username GitHub pemilik repository.
Jalankan di Chrome
flutter run -d chrome
Build Flutter Web
flutter build web --release
Hasil build akan tersedia di folder:
build/web/
Untuk deployment Flutter Web standar, gunakan hasil build tersebut sebagai folder publikasi Netlify. Pastikan file index.html berada di root folder yang dipublikasikan.
Struktur Folder
Bittaqwa/
├── assets/
│   ├── fonts/              # Font Poppins
│   └── image/              # Ilustrasi, ikon, dan thumbnail
├── lib/
│   ├── data/               # Data pendukung
│   ├── models/             # Model doa, jadwal sholat, dan video kajian
│   ├── presentation/
│   │   ├── screen/         # Dashboard dan halaman zakat
│   │   └── widget/         # Widget yang digunakan kembali
│   ├── screens/            # Halaman doa, jadwal sholat, dan kajian
│   ├── services/           # Integrasi layanan/API
│   └── main.dart           # Entry point aplikasi dan routing
├── test/                   # Unit/widget tests
├── web/                    # Konfigurasi Flutter Web
├── pubspec.yaml            # Dependency dan konfigurasi aset
└── README.md
Konfigurasi yang Perlu Diperhatikan
- Lokasi jadwal sholat: konfigurasi awal berada di lib/services/jadwal_sholat_service.dart (JAWA BARAT, KAB. BOGOR, dan label Jonggol, Kab Bogor). Sesuaikan dengan wilayah target sebelum aplikasi digunakan secara lebih luas.
- Ambang kalkulator zakat: nilai ambang harta saat ini ditetapkan di lib/presentation/screen/zakat_screan.dart. Periksa dan sesuaikan nilai tersebut berdasarkan ketentuan nisab serta harga emas terkini sebelum dipakai sebagai acuan pembayaran.
- Konten video kajian: daftar judul, channel, URL, dan deskripsi dikelola di lib/models/video_kajian_model.dart. Pemutaran tetap bergantung pada ketersediaan video dan kebijakan embed dari YouTube.
Deployment dengan Frame iPhone 16
Jika menggunakan paket preview iPhone 16 yang terpisah, deploy folder terluar yang berisi index.html dan folder app/ ke Netlify. Jangan upload folder app/ saja. Paket tersebut adalah halaman showcase/mockup untuk menampilkan hasil build Flutter di dalam frame iPhone; bukan aplikasi iOS native.
Catatan
- Jadwal sholat dapat menampilkan data fallback ketika API tidak dapat diakses.
- Video YouTube tertentu mungkin tidak dapat diputar melalui embedded player karena pembatasan dari pemilik video atau YouTube.
- Kalkulator zakat merupakan fitur estimasi. Untuk keputusan ibadah dan perhitungan zakat yang tepat, verifikasi nisab serta ketentuan yang berlaku dengan sumber atau pihak yang tepercaya.
Kontribusi
Ide, laporan bug, dan penyempurnaan fitur sangat terbuka. Saat mengirim perubahan, sertakan penjelasan singkat mengenai tujuan perubahan dan cara mengujinya.
Dibuat dengan Flutter. Semoga Bittaqwa bermanfaat dan menjadi sarana untuk terus belajar serta memperbaiki ibadah.
