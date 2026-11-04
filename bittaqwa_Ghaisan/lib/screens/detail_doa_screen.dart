import 'package:flutter/material.dart';
import 'package:bittaqwa_ghaisan/models/doa_model.dart';
import 'package:bittaqwa_ghaisan/screens/list_doa_screen.dart';

class DetailDoaScreen extends StatelessWidget {
  final DoaModel? doa;

  const DetailDoaScreen({super.key, this.doa});

  void _handleBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ListDoaScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Default fallback ke Do'a Berpakaian jika parameter null
    final DoaModel currentDoa = doa ?? listDoaRumah[0];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBack(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF8C53),
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              _handleBack(context);
            },
          ),
          title: Text(
            currentDoa.title,
            style: const TextStyle(
              fontFamily: 'PoppinsSemiBold',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/bg_detail_doa.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Judul Doa
                    Text(
                      currentDoa.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Teks Arab
                    Text(
                      currentDoa.arabic,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 22,
                        height: 1.9,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Terjemahan Bahasa Indonesia
                    Text(
                      currentDoa.translation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 13,
                        height: 1.6,
                        color: Color(0xFF6B8BA4),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Keterangan Sumber / Hadits
                    Text(
                      currentDoa.reference,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 11,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
