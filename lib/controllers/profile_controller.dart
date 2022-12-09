import 'package:example_1/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class ProfileController extends GetxController {
  late User _user;
  User get user => _user;

  bool _loading = true;
  bool get loading => _loading;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    _user = Get.arguments as User;
    _loading = false;
    update(['profile']);
  }

  void onInputTextChanged(String text) {
    _inputText = text;
  }

  void go2BackData() {
    if (_inputText.trim().isNotEmpty) {
      Get.back(result: _inputText);
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Ingrese valor válido"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Aceptar"),
            )
          ],
        ),
      );
    }
  }
}
