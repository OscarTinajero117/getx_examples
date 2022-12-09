// ignore_for_file: avoid_print

import 'package:example_1/controllers/reactive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      initState: (_) {},
      builder: (_) {
        print("Reactive getx");
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Obx(() {
                  //print("Counter");
                  return Text(
                    "${_.counter.value}",
                    style: const TextStyle(fontSize: 30),
                  );
                }),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Obx(() {
                  //print("Clock");
                  return Text(
                    _.dateTime.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30),
                  );
                }),
              )
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                onPressed: () {
                  _.increment();
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10.0),
              FloatingActionButton(
                heroTag: 'remove',
                onPressed: () {
                  _.decrement();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
