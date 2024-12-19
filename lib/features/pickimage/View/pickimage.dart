import 'package:calorie_counter_ai/features/pickimage/Controller/pickImageController.dart';
import 'package:calorie_counter_ai/features/confirmImage/View/confirmImage.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import 'package:camera/camera.dart';
import '../../../utils/const.dart';
import 'package:get/get.dart';

class PickImageScreen extends StatelessWidget {
  const PickImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickImageController>(
      init: PickImageController(),
      builder: (controller) {
        if (!controller.isCameraInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: Stack(
            children: [
              SizedBox.expand(
                child: CameraPreview(controller.cameraController),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      Const.cameraViewTEXT1,
                      style: TextStyle(
                        color: CColors.whiteColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      Const.cameraViewTEXT2,
                      style: TextStyle(
                        color: CColors.whiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      final imagePath = await controller.captureImage();
                      if (imagePath != null) {
                        // Navigate to the next screen and pass the image path
                        Get.to(() => ConfirmImageScreen(imagePath: imagePath));
                      } else {
                        Get.snackbar(
                          "Error",
                          "Failed to capture image",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CColors.blackColor,
                      ),
                      child: Center(
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
