import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CColors.lightGreenColor, // Light green background
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
              maxLines: 2, // Ensures the text wraps to two lines
              style: TextStyle(
                color: CColors.darkGreenColor, // Dark green text
                fontSize: 14,
                overflow:
                    TextOverflow.ellipsis, // Handles overflow with ellipsis
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateAccountDialog extends StatelessWidget {
  const CreateAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:CColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      title: const Text(
        'Restricted Access',
        style: TextStyle(
          color: CColors.blackColor, // Modern black title color
          fontWeight: FontWeight.w600, // A bit bolder
          fontSize: 18,
        ),
      ),
      content: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'You need an account to access more features.',
          style: TextStyle(
            fontSize: 15,
            color: CColors.blackColor, // Soft text color
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actions: [
        // Modern button to create account
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: CColors.greenColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text(
            'Create Account',
            style: TextStyle(
              color: CColors.whiteColor,
              fontSize: 16, // Slightly larger text
            ),
          ),
        ),
      ],
    );
  }
}


/// Widget to show the "Create Account" popup dialog.
void showCreateAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const CreateAccountDialog();
    },
  );
}