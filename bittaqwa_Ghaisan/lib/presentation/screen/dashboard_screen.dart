import 'package:flutter/material.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/zakat_screan.dart';
import 'package:bittaqwa_ghaisan/screens/doa_screen.dart';
import 'package:bittaqwa_ghaisan/screens/jadwal_sholat_screen.dart';
import 'package:bittaqwa_ghaisan/screens/video_kajian_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  String getBackgroundImage(DateTime now) {
    final hour = now.hour;
    if (hour < 12) {
      return 'assets/image/bg_header_dashboard_morning.png';
    } else if (hour < 18) {
      return 'assets/image/bg_header_dashboard_afternoon.png';
    } else {
      return 'assets/image/bg_header_dashboard_night.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [header(), cardMenus(context), cardInspiration()],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getBackgroundImage(DateTime.now())),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Text('Assalamualaikum Ghaisan'),
          ),
        ],
      ),
    );
  }

  Widget cardMenus(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepOrange,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoaScreen()),
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/image/ic_menu_doa.png'),
                  const Text(
                    "Doa-doa",
                    style: TextStyle(
                      fontFamily: 'PoppinsSemiBold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ZakatScreen()),
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/image/ic_menu_zakat.png'),
                  const Text(
                    "Zakat",
                    style: TextStyle(
                      fontFamily: 'PoppinsSemiBold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JadwalSholatScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/image/ic_menu_jadwal_sholat.png'),
                  const Text(
                    "Jadwal Sholat",
                    style: TextStyle(
                      fontFamily: 'PoppinsSemiBold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoKajianScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/image/ic_menu_video_kajian.png'),
                  const Text(
                    "Video",
                    style: TextStyle(
                      fontFamily: 'PoppinsSemiBold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardInspiration() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Inspirasi",
              style: TextStyle(fontFamily: 'PoppinsSemiBold', fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/image/img_inspiration.png'),
          const SizedBox(height: 8),
          Image.asset('assets/image/img_inspiration_2.png'),
        ],
      ),
    );
  }
}
