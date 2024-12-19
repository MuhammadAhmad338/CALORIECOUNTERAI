import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MealNameContainer extends StatelessWidget {
  const MealNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: CColors.whiteColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Const.mealContainerText1,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4.0),
             const   Text(
                Const.mealContainerText2,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: CColors.blackColor,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.edit,
            color: CColors.greenColor,
          ),
        ],
      ),
    );
  }
}
