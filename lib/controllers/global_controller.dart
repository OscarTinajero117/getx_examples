// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:example_1/models/product.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  bool _loading = true;
  bool get loading => _loading;

  List<Product> _products = [];
  List<Product> get products => _products;

  final Map<String, Product> _favorites = {};
  Map<String, Product> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();

    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    _products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();

    _loading = false;
    print("--> products up");
    update(['products']);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = _products[index];
    product.isFavorite = isFavorite;

    if (isFavorite) {
      _favorites[product.name] = product;
    } else {
      _favorites.remove(product.name);
    }

    update(['products', 'favorites']);
  }
}
