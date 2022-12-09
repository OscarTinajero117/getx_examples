//import 'package:example_1/controllers/global_controller.dart';
//import 'package:example_1/pages/home_page.dart';
import 'package:example_1/pages/reactive_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(GlobalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReactivePage(),
    );
  }
}
