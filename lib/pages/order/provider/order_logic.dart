import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_app/models/add_product_model.dart';
import 'package:learn_app/pages/login/provider/login_logic.dart';
import 'package:learn_app/pages/order/provider/order_state.dart';
import 'package:learn_app/repository/product_repository.dart';
import 'package:learn_app/services/services.dart';
import 'package:learn_app/widgets/alert_loading.dart';
import 'package:provider/provider.dart';
import '../../../utils/secure_storage.dart';

class OrderLogic extends ChangeNotifier {
  OrderState _orderState = OrderState.initial();

  final ProductRepository _productRepo = ProductRepository(
    services: Services(),
  );
  final SecureStorage secureStorage = SecureStorage();

  OrderState get orderState => _orderState;

  Future<void> addProduct({
    required BuildContext context,
    required String producName,
    String? desc,
    required String price,
    required String stock,
    required String discount,
    required String brand,
  }) async {
    alertLoading(context);
    final token = await context.read<LoginLogic>().getToken();
    // final token = await secureStorage.readToken();
    try {
      // 20,000
      // 2,000,000
      // 20000000 , 10000
      print('price before ==>$price');
      final convertPrice = double.parse(price.replaceAll(',', ''));
      final convertDiscount = double.parse(discount.replaceAll(',', ''));
      print('price after convert ==>$convertPrice');
      final result = await _productRepo.addProduct(
        token: token ?? "",
        producName: producName,
        price: convertPrice,
        discount: convertDiscount,
        stock: int.parse(stock),
        brand: brand,
      );
      if (result.success == true) {
        final data = addProductModelFromJson(jsonEncode(result.data));
        _orderState = orderState.copyWith(addProduct: data);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('ເພີ່ມສິນຄ້າສຳເລັດ'),
          ),
        );
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('ເພີ່ມສິນຄ້າບໍ່ໄດ້'),
          ),
        );
      }
    } catch (e) {
      print('error');
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text('${e.toString()}')),
      );
    }
  }
}
