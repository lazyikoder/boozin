import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:lol/app/services/health_services.dart';

class HomeController extends GetxController {
  var healthPoint = <HealthDataPoint>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchHealthData();
  }

  void fetchHealthData() async {
    try {
      isLoading.value = true;
      final healthData = await HealthService().fetchHealthData();
      healthPoint.assignAll(healthData);
      if (healthPoint.isEmpty) {
        Get.snackbar("Boozin Fit", "No Data Found");
      }
      isLoading.value = false;
    } catch (e) {
      print("Error Occured in HomeController class");
      // error.value = e.toString();
    }
    // update();
  }
}
