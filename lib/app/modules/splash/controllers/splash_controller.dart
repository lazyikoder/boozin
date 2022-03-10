import 'package:get/get.dart';
import 'package:lol/app/modules/home/views/home_view.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  void onClose() {}
  void increment() => count.value++;
}
