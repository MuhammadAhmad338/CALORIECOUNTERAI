import 'package:calorie_counter_ai/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';
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

class AccountRequiredBottomSheet extends StatelessWidget {
  const AccountRequiredBottomSheet({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
        color: CColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const Text(
            'You Need an Account',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You need an account to access more features. Create your account now to unlock premium features.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color:CColors.greyColor,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Modern primary button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FilledButton(
              onPressed: () {
                _launchURL('https://caloriescounter.ai');
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: CColors.greenColor, // iOS blue color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color:CColors.whiteColor,
                ),
              ),
            ),
          ),
          // Modern secondary button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              minimumSize: const Size(88, 40),
              foregroundColor: Colors.grey[700],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}