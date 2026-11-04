class JadwalSholatModel {
  final String tanggal;
  final String subuh;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;
  final String lokasi;

  const JadwalSholatModel({
    required this.tanggal,
    required this.subuh,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    this.lokasi = "Jonggol, Kab Bogor",
  });

  factory JadwalSholatModel.fromJson(Map<String, dynamic> json, {String lokasi = "Jonggol, Kab Bogor"}) {
    return JadwalSholatModel(
      tanggal: json['tanggal']?.toString() ?? '',
      subuh: json['subuh']?.toString() ?? '04:30',
      dzuhur: json['dzuhur']?.toString() ?? '11:53',
      ashar: json['ashar']?.toString() ?? '15:00',
      maghrib: json['maghrib']?.toString() ?? '17:50',
      isya: json['isya']?.toString() ?? '19:01',
      lokasi: lokasi,
    );
  }

  // Fallback default sesuai dengan tampilan desain referensi
  factory JadwalSholatModel.defaultJadwal() {
    return const JadwalSholatModel(
      tanggal: "Minggu, 29 Juli",
      subuh: "04:30",
      dzuhur: "11:53",
      ashar: "15:00",
      maghrib: "17:50",
      isya: "19:01",
      lokasi: "Jonggol, Kab Bogor",
    );
  }
}

