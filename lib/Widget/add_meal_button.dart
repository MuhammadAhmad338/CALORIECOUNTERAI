import 'package:calorie_counter_ai/features/pickedimage/View/pickedimage.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';

class AddMealButton extends StatelessWidget {
  const AddMealButton({Key? key}) : super(key: key);

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
          Get.to(() => const PickedImageScreen());
        },
        icon: const Icon(
          Icons.add_circle_outline,
          color: CColors.whiteColor,
        ),
        label: const Text(
          "Πρόσθεσε νέο γεύμα",
          style: TextStyle(
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