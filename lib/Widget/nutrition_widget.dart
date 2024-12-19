import 'package:calorie_counter_ai/utils/colors.dart';
import 'package:flutter/material.dart';

class NutritionContainer extends StatelessWidget {
  const NutritionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
      child: Material(
        borderRadius: BorderRadius.circular(12.0), // Match the container's border radius
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: CColors.whiteColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // First Nutrition Item
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                      
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: CColors.blueColor, width: 8.0),
                        ),
                      ),
                     const  Text(
                        '18g',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                 const  SizedBox(height: 8.0),
                 const  Text(
                    'Πρωτεΐνες',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Second Nutrition Item
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                      width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: CColors.yellowColor, width: 8.0),
                        ),
                      ),
                     const  Text(
                        '8g',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                 const  SizedBox(height: 8.0),
                 const  Text(
                    'Υδατάνθρακες',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Third Nutrition Item
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: CColors.purpleColor, width: 8.0),
                        ),
                      ),
                     const  Text(
                        '6g',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(height: 8.0),
                 const  Text(
                    'Λιπαρά',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}