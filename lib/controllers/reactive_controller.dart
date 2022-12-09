import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReactiveController extends GetxController {
  RxString dateTime =
      DateFormat('h:mm:ss a \n EEE d MMM').format(DateTime.now()).obs;

  RxInt counter = 0.obs;

  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime.value =
          DateFormat('h:mm:ss a \n EEE d MMM').format(DateTime.now());
    });
    super.onInit();
  }

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}
