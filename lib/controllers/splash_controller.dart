import 'package:example_1/pages/home_page.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(
        const HomePage(),
        transition: Transition.zoom,
      );
    });
  }
}
