import 'package:calorie_counter_ai/features/dashboard/Controller/dashboardController.dart';
import 'package:get/get.dart';

class InitialbindingsImplementation implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
  }
}