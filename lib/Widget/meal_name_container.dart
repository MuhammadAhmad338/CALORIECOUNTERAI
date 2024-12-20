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
        color: CColors.greyColor.withOpacity(0.09),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Const.mealContainerText1,
                style: TextStyle(
                  fontSize: 14.0,
                  color: CColors.blackColor,
                ),
              ),
               SizedBox(height: 4.0),
               Text(
                Const.mealContainerText2,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: CColors.blackColor,
                ),
              ),
            ],
          ),
           Container(
            padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CColors.greenColor.withOpacity(0.1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 1,
                  //     blurRadius: 3,
                  //     offset: Offset(0, 1),
                  //   ),
                  // ],
                ),
                child: 
                
                   Icon(
                    Icons.edit_outlined,
                    color: CColors.greenColor,
                    size: 20,
                  ),
                ),
              
        ],
      ),
    );
  }
}
