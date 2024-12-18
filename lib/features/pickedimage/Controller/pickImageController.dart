import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class PickImageController extends GetxController {
  // Declare the CameraController
  late CameraController cameraController;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  // Initialize the camera
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first; // Use the first available camera (you can change this as needed)
    cameraController = CameraController(camera, ResolutionPreset.high);
    await cameraController.initialize();
    update(); // Update the controller to reflect changes in UI
  }

  // Dispose the camera when done
  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}