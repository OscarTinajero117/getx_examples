import 'package:example_1/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text',
      builder: (_) => Text(_.counter.toString()),
    );
  }
}
