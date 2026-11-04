import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/dashboard_screen.dart';
import 'package:bittaqwa_ghaisan/presentation/widget/card_result_harta.dart';

class ZakatScreen extends StatefulWidget {
  const ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  final MoneyMaskedTextController controllerRupiah = MoneyMaskedTextController(
    thousandSeparator: '.',
    precision: 0,
    decimalSeparator: ',',
  );

  final double minimumHarta = 91000000;

  double totalHarta = 0;
  double zakatDikeluarkan = 0;
  bool sudahDihitung = false;

  final NumberFormat formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void dispose() {
    controllerRupiah.dispose();
    super.dispose();
  }

  void hitungZakat() {
    final double harta = controllerRupiah.numberValue;

    setState(() {
      totalHarta = harta;
      zakatDikeluarkan = harta >= minimumHarta ? harta * 0.025 : 0;
      sudahDihitung = true;
    });

    FocusScope.of(context).unfocus();
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

  @override
  Widget build(BuildContext context) {
    final String formattedTotalHarta = formatRupiah.format(totalHarta);
    final String formattedZakatDikeluarkan = formatRupiah.format(
      zakatDikeluarkan,
    );

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
          title: const Text(
            'Zakat',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PoppinsSemiBold',
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              _navigateBackToDashboard(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Gambar Header Zakat
              Image.asset(
                'assets/image/bg_header_zakat.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),

              // Card Input Total Harta
              cardHarta(),
              const SizedBox(height: 8),

              // Card Hasil Perhitungan Zakat
              cardResult(formattedTotalHarta, formattedZakatDikeluarkan),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHarta() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Harta',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 16,
              fontFamily: 'PoppinsSemiBold',
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: controllerRupiah,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontFamily: 'PoppinsMedium',
              fontSize: 14,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              labelText: 'Masukkan Total Harta',
              labelStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
                fontFamily: 'PoppinsRegular',
              ),
              fillColor: Colors.white,
              filled: true,
              prefixText: 'Rp. ',
              prefixStyle: const TextStyle(
                fontFamily: 'PoppinsMedium',
                color: Colors.black87,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.orange, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.orange, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: hitungZakat,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
              minimumSize: const Size(double.infinity, 0),
              elevation: 0,
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PoppinsBold',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardResult(
    String formattedTotalHarta,
    String formattedZakatDikeluarkan,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardResultHarta(
            title: 'Total Harta',
            result: formattedTotalHarta,
            color: Colors.redAccent,
          ),
          const SizedBox(height: 16),
          CardResultHarta(
            title: 'Zakat Dikeluarkan',
            result: formattedZakatDikeluarkan,
            color: const Color.fromARGB(255, 128, 80, 249),
          ),
        ],
      ),
    );
  }
}
