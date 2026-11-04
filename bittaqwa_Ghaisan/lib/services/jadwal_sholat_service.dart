import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:bittaqwa_ghaisan/models/jadwal_sholat_model.dart';

class JadwalSholatService {
  static const String _baseUrl = 'https://equran.id/api/v2/shalat';

  /// Mengambil data jadwal shalat untuk wilayah Jonggol, Kab. Bogor
  Future<JadwalSholatModel> getJadwalSholat({
    String provinsi = "JAWA BARAT",
    String kabkota = "KAB. BOGOR",
    String lokasiLabel = "Jonggol, Kab Bogor",
  }) async {
    final DateTime now = DateTime.now();

    try {
      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'provinsi': provinsi,
              'kabkota': kabkota,
              'bulan': now.month,
              'tahun': now.year,
            }),
          )
          .timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['data'] != null &&
            responseData['data']['jadwal'] != null) {
          final List<dynamic> jadwalList = responseData['data']['jadwal'];

          // Cari jadwal hari ini berdasarkan tanggal atau indeks hari
          final String formattedDay = DateFormat('dd').format(now);
          final int dayIndex = now.day - 1;

          Map<String, dynamic>? todaySchedule;

          // Coba cari kecocokan tanggal (format dd-MM-yyyy atau d)
          for (final item in jadwalList) {
            final String? tgl = item['tanggal']?.toString();
            if (tgl != null && tgl.startsWith(formattedDay)) {
              todaySchedule = item as Map<String, dynamic>;
              break;
            }
          }

          // Jika tidak ditemukan dengan prefix, ambil berdasarkan indeks hari
          if (todaySchedule == null &&
              dayIndex >= 0 &&
              dayIndex < jadwalList.length) {
            todaySchedule = jadwalList[dayIndex] as Map<String, dynamic>;
          }

          if (todaySchedule != null) {
            return JadwalSholatModel.fromJson(
              todaySchedule,
              lokasi: lokasiLabel,
            );
          }
        }
      }
    } catch (e) {
      // Abaikan error / offline fallback data
    }

    // Jika terjadi timeout/offline atau gagal parsing, gunakan data fallback yang presisi
    return JadwalSholatModel.defaultJadwal();
  }
}

