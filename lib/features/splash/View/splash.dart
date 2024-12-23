import 'package:calorie_counter_ai/features/dashboard/View/dashboard.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.whiteColor,
      body: Center(
      child: Image.asset(
        Const.splashImage,
        height: 200,
        width: 200,
      ),
    ));
  }
}
