import 'dart:io';
import 'package:flutter/material.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:calorie_counter_ai/Widget/nutrition_widget.dart';
import 'package:calorie_counter_ai/Widget/meal_name_container.dart';
import 'package:calorie_counter_ai/Widget/add_meal_and_confirm_image_button.dart';

import '../../../utils/colors.dart';

class PickedImageScreen extends StatelessWidget {
  final String imagePath;
  const PickedImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Const
                            .capturedimagetitle, // Replace with Const.capturedimagetitle
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Const
                            .capturedimagelabel, // Replace with Const.capturedimagelabel
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 170,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners                     
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // Match the border radius
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.cover, // Ensures the image scales to fit nicely
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MealNameContainer(),
                ),
                const SizedBox(height: 20),
                const NutritionContainer(),
              ],
            ),
            // Button positioned at the bottom of the screen
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:  TickCapturedImage(
                  buttonText: Const.confirmImageTextbutton,
                  imagePath: imagePath,
                  // Replace with Const.confirmCapturedImageButton
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
