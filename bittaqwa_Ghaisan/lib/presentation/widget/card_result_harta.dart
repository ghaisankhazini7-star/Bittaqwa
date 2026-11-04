import 'package:flutter/material.dart';

class CardResultHarta extends StatelessWidget {
  final String title;
  final String result;
  final Color color;

  const CardResultHarta({
    super.key,
    required this.title,
    required this.result,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "PoppinsMedium",
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            result,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "PoppinsBold",
            ),
          ),
        ],
      ),
    );
  }
}
