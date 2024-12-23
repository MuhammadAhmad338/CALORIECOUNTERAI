import 'package:calorie_counter_ai/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/const.dart';

class DailyGoalWidget extends StatelessWidget {
  const DailyGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: CColors.greyColor.withOpacity(0.09),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular progress
          // Circular progress
          Stack(
            alignment: Alignment.center,
            children: [
              // Circular progress
              Container(
                  width: 150.0, // Set the desired width (radius)
                  height: 150.0, // Set the desired height (radius)
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: const CircularProgressIndicator(
                    value: 1, // Progress value (260 out of 520)
                    strokeWidth: 20.0,
                    color:  CColors.greenColor,
                    backgroundColor:  CColors.whiteColor,
                  )),
              // Center content
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '260 από',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: CColors.blackColor,
                    ),
                  ),
                  Text(
                    Const.dailygoalText1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CColors.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          // Bottom text
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: CColors.whiteColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0),
              // border: Border.all(color: CColors.greenColor),
            ),
            child: const Text(
              Const.dailygoalText2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: CColors.greenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
