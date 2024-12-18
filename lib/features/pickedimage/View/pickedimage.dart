import 'package:calorie_counter_ai/features/pickedimage/Controller/pickImageController.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickedImageScreen extends StatelessWidget {
  const PickedImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bind the controller
    // Bind the controller
    return GetBuilder<PickImageController>(
       init: PickImageController(),
      builder: (controller) {
        // Check if the camera is initialized
        if (!controller.cameraController.value.isInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          body: SizedBox.expand(
            child: CameraPreview(controller.cameraController), // Ensures full-screen camera preview
          ),
        );
      },
    );
  }
}