import 'package:calorie_counter_ai/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/const.dart';

class DailyGoalWidget extends StatelessWidget {
  const DailyGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(14.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular progress
        // Circular progress
    Stack(
      alignment: Alignment.center,
      children: [
        // Outer circular progress indicator
         // Circular progress  
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: CircularProgressIndicator(
                  value: 0.5, // Progress value (260 out of 520)
                  strokeWidth: 20.0,
                  color: CColors.greenColor,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
        // Center content
        const Padding(
          padding: EdgeInsets.all(12), // Add padding around the Column
          child: Column(
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
        ), 
                ],
              ),        
          const SizedBox(height: 20.0),
          // Bottom text
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: CColors.whiteColor,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: CColors.greenColor),
            ),
            child: const Text(
              Const.dailygoalText2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
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
