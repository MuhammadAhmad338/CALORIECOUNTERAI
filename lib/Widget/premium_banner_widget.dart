import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 252, 226), // Light green background
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            '✨',
            style: TextStyle(fontSize: 30),
          ),
           SizedBox(width: 8),
           Expanded(
            child: Text(
              Const.premiumBanner,
              style: TextStyle(
                color: Color(0xFF2C5E2C), // Dark green text
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
