import 'package:flutter/material.dart';
import 'package:bittaqwa_ghaisan/models/doa_model.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/dashboard_screen.dart';
import 'package:bittaqwa_ghaisan/screens/list_doa_screen.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _navigateBackToDashboard(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
            "Do'a-doa",
            style: TextStyle(
              fontFamily: 'PoppinsSemiBold',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ilustrasi banner pemandangan (langit, awan, matahari, pohon, rumput)
              Image.asset(
                'assets/image/bg_header_doa.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),

              // Grid card kategori doa (3 kolom sesuai gambar referensi, 2 baris)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listDoaCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) {
                    final category = listDoaCategories[index];
                    return GestureDetector(
                      onTap: () {
                        // Interaksi: Navigasi ke ListDoaScreen ketika kategori diklik (contoh: Rumah)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListDoaScreen(
                              category: category.title.replaceAll('\n', ' '),
                              icon: category.icon,
                              doaList: category.doas,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 14,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              category.icon,
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              category.title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 13,
                                color: Colors.black87,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
