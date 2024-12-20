import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../pickedimage/View/pickedImage.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:calorie_counter_ai/utils/colors.dart';
import 'package:calorie_counter_ai/features/pickimage/View/pickimage.dart';

class ConfirmImageScreen extends StatelessWidget {
  final String imagePath;
  const ConfirmImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.whiteColor,
  body: SafeArea(
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.max, // Ensures the Column takes only the space it needs
        children: [
          const SizedBox(height: 15),
          const Text(
            Const.confirmImageLabel,
            style: TextStyle( fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 300,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0), // Rounded corners
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0), // Match the border radius
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover, // Ensures the image scales to fit nicely
                )
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: InfoBanner(
              message: Const.infoBannerText,
            ),
          ),
         const SizedBox(height: 35,),
         const ActionsRow(),
         const SizedBox(height: 40,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20.0),
           child: BarcodeCapturedImage(
             buttonText: Const
                 .confirmCapturedImageButton,
                 imagePath: imagePath,
                  // Replace with Const.confirmCapturedImageButton
           ),
         ),
        ],
      ),
    ),
  ),
);
  }
}


class BarcodeCapturedImage extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  const BarcodeCapturedImage({Key? key, required this.buttonText, required this.imagePath}) : super(key: key);

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
        Get.off(() =>  PickedImageScreen(imagePath: imagePath,));
        },
        icon: const Icon(
           Icons.qr_code_scanner_outlined, // Replace with your desired icons,
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

class InfoBanner extends StatelessWidget {
  final String message;

  const InfoBanner({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CColors.whiteColor, // Light green background
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.green.shade700,
            size: 30,
          ),
          const SizedBox(width: 8.0), // Spacing between the icon and text
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const IconTextButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(30.0),
            backgroundColor: CColors.greyColor.withOpacity(0.09), // Light background color
            elevation: 0,
          ),
          child: Icon(
            icon,
            size: 30.0,
            color: CColors.greenColor,
          ),
        ),
        const SizedBox(height: 8.0), // Spacing between icon and text
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color:CColors.blackColor,
          ),
        ),
      ],
    );
  }
}

class ActionsRow extends StatelessWidget {
  const ActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          
          icon: Icons.refresh,
          text: "Επανάληψη\nΦωτογραφίας",
          onPressed: () {
            // Add your logic here
            Get.off(() => const PickImageScreen());
          },
        ),
        IconTextButton(
          icon: Icons.add_circle_outline,
          text: "Προσθήκη άλλου\nπιάτου γεύματος",
          onPressed: () {
            // Add your logic here
               Get.off(() => const PickImageScreen());
          },
        ),
      ],
    );
  }
}


