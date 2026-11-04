import 'package:flutter/material.dart';
import 'package:bittaqwa_ghaisan/models/doa_model.dart';
import 'package:bittaqwa_ghaisan/screens/detail_doa_screen.dart';
import 'package:bittaqwa_ghaisan/screens/doa_screen.dart';

class ListDoaScreen extends StatelessWidget {
  final String? category;
  final String? icon;
  final List<DoaModel>? doaList;

  const ListDoaScreen({super.key, this.category, this.icon, this.doaList});

  void _handleBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DoaScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Default fallback ke kategori "Rumah"
    final String currentCategory = category ?? "Rumah";
    final String currentIcon = icon ?? "assets/image/ic_doa_rumah.png";
    final List<DoaModel> currentDoaList = doaList ?? listDoaRumah;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBack(context);
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
              _handleBack(context);
            },
          ),
          title: Text(
            currentCategory,
            style: const TextStyle(
              fontFamily: 'PoppinsSemiBold',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: currentDoaList.length,
          itemBuilder: (context, index) {
            final doa = currentDoaList[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    // Navigasi ke DetailDoaScreen saat item diklik (contoh: Do'a Berpakaian)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDoaScreen(doa: doa),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          currentIcon,
                          width: 52,
                          height: 52,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            doa.title,
                            style: const TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
