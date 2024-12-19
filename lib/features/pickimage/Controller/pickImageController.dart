import 'package:camera/camera.dart';
import 'package:get/get.dart';

class PickImageController extends GetxController {
  late CameraController cameraController;
  RxBool isCameraInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  // Initialize the camera
  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final camera = cameras.first; // Use the first available camera
      cameraController = CameraController(camera, ResolutionPreset.high);
      await cameraController.initialize();
      isCameraInitialized.value = true; // Mark as initialized
    } catch (e) {
      print("Error initializing camera: $e");
    }
    update();
  }

  // Capture an image without saving
  Future<String?> captureImage() async {
    if (!cameraController.value.isInitialized || cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile picture = await cameraController.takePicture();
      return picture.path; // Return the temporary path of the image
    } catch (e) {
      print("Error capturing image: $e");
      return null;
    }
  }

  @override
  void onClose() {
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    super.onClose();
  }
}

