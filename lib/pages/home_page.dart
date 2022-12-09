import 'package:example_1/controllers/global_controller.dart';
import 'package:example_1/controllers/home_controller.dart';
//import 'package:example_1/pages/home_pages_widgets/home_list.dart';
import 'package:example_1/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                  id: 'favorites',
                  builder: (_) => TextButton(
                    onPressed: () {},
                    child: Text(
                      "Favoitos (${_.favorites.length})",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            //body: const HomeList(),
            body: const ProductList(),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     // _.increment();
            //   },
            //   child: const Icon(Icons.add),
            // ),
          );
        });
  }
}
