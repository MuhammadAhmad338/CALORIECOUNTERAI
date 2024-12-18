import 'package:flutter/material.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9FDF1), // Light green background
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            '✨',
            style: TextStyle(fontSize: 20),
          ),
           SizedBox(width: 8),
           Expanded(
            child: Text(
              'Αναβαθμίστε σε Premium και\nκαταγράψτε καθημερινά τα γεύματά σας!',
              style: TextStyle(
                color: Color(0xFF2C5E2C), // Dark green text
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
