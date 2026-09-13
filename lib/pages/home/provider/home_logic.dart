import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_app/model/product_model.dart';

class HomeLogic extends ChangeNotifier {
  void update() {
    notifyListeners();
  }

  Future<void> getListProduct() async {
    try {
      final List<ProductsModel> products = productsModelFromJson(
        jsonEncode([]),
      );
      debugPrint('Loaded ${products.length} products');
    } catch (e) {
      debugPrint('Failed to load products: $e');
    }
  }
}
