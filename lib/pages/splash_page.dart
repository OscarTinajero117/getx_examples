// ignore_for_file: avoid_print

import 'package:example_1/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      dispose: (_) => print("Normal Dispose"),
      init: SplashController(),
      builder: (_) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
