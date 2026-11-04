import 'package:flutter/material.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/dashboard_screen.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/zakat_screan.dart';
import 'package:bittaqwa_ghaisan/screens/doa_screen.dart';
import 'package:bittaqwa_ghaisan/screens/jadwal_sholat_screen.dart';
import 'package:bittaqwa_ghaisan/screens/video_kajian_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bittaqwa App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF8C53)),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
      routes: {
        'doa': (context) => const DoaScreen(),
        '/doa': (context) => const DoaScreen(),
        'zakat': (context) => const ZakatScreen(),
        '/zakat': (context) => const ZakatScreen(),
        'jadwal-sholat': (context) => const JadwalSholatScreen(),
        '/jadwal-sholat': (context) => const JadwalSholatScreen(),
        'video-kajian': (context) => const VideoKajianScreen(),
        '/video-kajian': (context) => const VideoKajianScreen(),
      },
    );
  }
}
