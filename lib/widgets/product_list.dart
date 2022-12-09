import 'package:example_1/controllers/global_controller.dart';
import 'package:example_1/models/product.dart';
import 'package:example_1/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      initState: (_) {},
      builder: (_) {
        if (_.loading) {
          return const SplashGlobal(mensaje: "Welcome!");
        }
        return ListView.builder(
          itemBuilder: (__, index) {
            final Product product = _.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text("\$ ${product.price} USD"),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  _.onFavorite(index, !product.isFavorite);
                },
              ),
            );
          },
          itemCount: _.products.length,
        );
      },
    );
  }
}
