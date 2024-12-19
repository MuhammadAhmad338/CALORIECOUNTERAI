import 'package:calorie_counter_ai/features/pickedimage/View/pickedimage.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:calorie_counter_ai/features/pickimage/View/pickimage.dart';

class AddMealButton extends StatelessWidget {
  final String buttonText;
  const AddMealButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    // final PickImageController dashboardController = Get.find<PickImageController>();
    return Container(
      margin: const EdgeInsets.all(12),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: CColors.greenColor, // Green background color
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: TextButton.icon(
        onPressed: () {
          // Action when button is pressed
          // print("Add New Meal Button Pressed!");
          Get.to(() => const PickImageScreen());
        },
        icon: const Icon(
          Icons.add_circle_outline,
          color: CColors.whiteColor,
        ),
        label:  Text(
          buttonText,
          style: const TextStyle(
            color: CColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextButton.styleFrom(
          foregroundColor: CColors.whiteColor, // Icon/Text color
          padding: const EdgeInsets.symmetric(horizontal: 24), // Button padding
          alignment: Alignment.center,
        ),
      ),
    );
  }
}


class ConfirmCapturedImage extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  const ConfirmCapturedImage({Key? key, required this.buttonText, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final PickImageController dashboardController = Get.find<PickImageController>();
    return Container(
      margin: const EdgeInsets.all(12),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: CColors.greenColor, // Green background color
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: TextButton.icon(
        onPressed: () {
          // Action when button is pressed
          // print("Add New Meal Button Pressed!");
        Get.to(() =>  PickedImageScreen(imagePath: imagePath,));
        },
        icon: const Icon(
           Icons.qr_code_scanner, // Replace with your desired icons,
          color: CColors.whiteColor,
        ),
        label:  Text(
          buttonText,
          style: const TextStyle(
            color: CColors.whiteColor,
            fontSize: 18,
          ),
        ),
        style: TextButton.styleFrom(
          foregroundColor: CColors.whiteColor, // Icon/Text color
          padding: const EdgeInsets.symmetric(horizontal: 24), // Button padding
          alignment: Alignment.center,
        ),
      ),
    );
  }
}