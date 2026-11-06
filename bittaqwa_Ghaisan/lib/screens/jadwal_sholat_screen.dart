import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:bittaqwa_ghaisan/models/jadwal_sholat_model.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/dashboard_screen.dart';
import 'package:bittaqwa_ghaisan/services/jadwal_sholat_service.dart';

class JadwalSholatScreen extends StatefulWidget {
  const JadwalSholatScreen({super.key});

  @override
  State<JadwalSholatScreen> createState() => _JadwalSholatScreenState();
}

class _JadwalSholatScreenState extends State<JadwalSholatScreen> {
  final JadwalSholatService _service = JadwalSholatService();
  late Future<JadwalSholatModel> _jadwalFuture;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
    _jadwalFuture = _service.getJadwalSholat();
  }

  void _navigateBackToDashboard(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  String _getFormattedDate() {
    try {
      final now = DateTime.now();
      return DateFormat('EEEE, d MMMM', 'id_ID').format(now);
    } catch (_) {
      return "Minggu, 29 Juli";
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _navigateBackToDashboard(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F2FD),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF8C53),
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              _navigateBackToDashboard(context); 
            },
          ),
          title: const Text(
            "Jadwal Sholat",
            style: TextStyle(
              fontFamily: 'PoppinsSemiBold',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: FutureBuilder<JadwalSholatModel>(
          future: _jadwalFuture,
          builder: (context, snapshot) {
            final JadwalSholatModel data =
                snapshot.data ?? JadwalSholatModel.defaultJadwal();

            return SingleChildScrollView(
              child: Stack(
                children: [
                  // Header dengan nuansa malam / bintang
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image/bg_header_jadwal_sholat.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Teks Tanggal
                            Text(
                              _getFormattedDate(),
                              style: const TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Lokasi Jonggol, Kab Bogor
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.redAccent,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  data.lokasi,
                                  style: const TextStyle(
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Container card putih melengkung berisi list waktu sholat
                  Container(
                    margin: const EdgeInsets.only(
                      top: 155,
                      left: 20,
                      right: 20,
                      bottom: 30,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSholatItem("Subuh", data.subuh),
                        _buildDivider(),
                        _buildSholatItem("Dzuhur", data.dzuhur),
                        _buildDivider(),
                        _buildSholatItem("Ashar", data.ashar),
                        _buildDivider(),
                        _buildSholatItem("Maghrib", data.maghrib),
                        _buildDivider(),
                        _buildSholatItem("Isya", data.isya),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSholatItem(String name, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'PoppinsBold',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 14),
              Image.asset(
                'assets/image/img_clock.png',
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade200, thickness: 1.2, height: 20);
  }
}
